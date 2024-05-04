param (
    [string]$task = "active"
)

if ($task -eq "active") {
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
    .\venv\Scripts\activate
    Write-Output "`nThe Python used in the '$(Split-Path -Leaf $env:VIRTUAL_ENV)' environment is:"
    Get-Command python
} elseif ($task -eq "make") {
    Remove-Item -Path ".\venv" -Recurse -Force -ErrorAction SilentlyContinue
    python -m venv ./venv
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
    .\venv\Scripts\activate
    Write-Output "`nThe Python used in the '$(Split-Path -Leaf $env:VIRTUAL_ENV)' environment is:"
    Get-Command python
    python.exe -m pip install --upgrade pip
    pip install poetry==1.8.2
    Remove-Item -Path 'poetry.lock' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'requirements.txt' -Force -ErrorAction SilentlyContinue
    poetry config warnings.export false
    poetry install --no-root
    poetry export --output requirements.txt
} elseif ($task -eq "clean") {
    # remove virtual environment to start over
    Remove-Item -Path ".\venv" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'poetry.lock' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'requirements.txt' -Force -ErrorAction SilentlyContinue
} else {
    # invalid task argument
    Write-Output "Only active, make or clean are allowed as tasks"
}
