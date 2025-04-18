param (
    [string]$task = "active"
)

$ErrorActionPreference = 'Stop'

# Function to get the latest Python 3.13 version from pyenv
function Get-LatestPython313Version {
    $versions = pyenv versions --bare 3.13.*
    $latestVersion = $versions | Where-Object { $_ -match '^3\.13\.\d+$' } | Sort-Object -Descending | Select-Object -First 1
    return $latestVersion
}

if ($task -eq "active")
{
    .\venv\Scripts\activate
    if ($null -ne $env:PYTHONPATH)
    {
        if (-not ($env:PYTHONPATH -match [regex]::Escape($PWD)))
        {
            $env:PYTHONPATH = "$PWD" + ";$env:PYTHONPATH"
            Write-Output "`nPYTHONPATH changed. It is '$( $env:PYTHONPATH )'"
        }
        else
        {
            Write-Output "`nPYTHONPATH not changed. It is '$( $env:PYTHONPATH )'"
        }
    }
    else
    {
        $env:PYTHONPATH = $PWD
        Write-Output "`nPYTHONPATH set to: $( $env:PYTHONPATH )"
    }
    Write-Output "`nThe Python used in the '$(Split-Path -Leaf $env:VIRTUAL_ENV)' environment is:"
    Get-Command python
}
elseif ($task -eq "make")
{
    Remove-Item -Path ".\venv" -Recurse -Force -ErrorAction SilentlyContinue
    if (Test-Path $env:USERPROFILE\.pyenv) {
        $latestVersion = Get-LatestPython313Version
        if ($latestVersion) {
            pyenv global $latestVersion
            pyenv local $latestVersion
            Remove-Item -Path '.python-version' -Force -ErrorAction SilentlyContinue
            Write-Output "Python $latestVersion set as both local and global version using pyenv."
        } else {
            Write-Warning "No Python 3.13 versions found with pyenv."
        }
    } else {
        $pythonVersion = python --version 2>&1
        if ($pythonVersion -like "*3.13*") {
            Write-Output "Python 3.13 is identified as the system's Python version."
        } else {
            Write-Warning "Python 3.13 is not installed or configured. Please install Python 3.13 or pyenv."
        }
    }
    python -m venv ./venv
    if ($?) {
        Write-Host "Virtual environment 'venv' created successfully." -ForegroundColor Green
    } else {
        Write-Host "Failed to create virtual environment 'venv'." -ForegroundColor Red
        exit 1
    }
    .\venv\Scripts\activate
    if ($null -ne $env:PYTHONPATH)
    {
        if (-not ($env:PYTHONPATH -match [regex]::Escape($PWD)))
        {
            $env:PYTHONPATH = "$PWD" + ";$env:PYTHONPATH"
            Write-Output "`nPYTHONPATH changed. It is '$( $env:PYTHONPATH )'"
        }
        else
        {
            Write-Output "`nPYTHONPATH not changed. It is '$( $env:PYTHONPATH )'"
        }
    }
    else
    {
        $env:PYTHONPATH = $PWD
        Write-Output "`nPYTHONPATH set to: $( $env:PYTHONPATH )"
    }
    Write-Output "`nThe Python used in the '$(Split-Path -Leaf $env:VIRTUAL_ENV)' environment is:"
    Get-Command python
    python.exe -m pip install --upgrade pip
    pip install poetry==2.1.1
    Remove-Item -Path 'poetry.lock' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'requirements.txt' -Force -ErrorAction SilentlyContinue
    poetry config warnings.export false
    poetry install --no-root
    poetry export --output requirements.txt
}
elseif ($task -eq "clean")
{
    Remove-Item -Path ".\venv" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'poetry.lock' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'requirements.txt' -Force -ErrorAction SilentlyContinue
} else {
    Write-Output "Only active, make or clean are allowed as tasks"
}
