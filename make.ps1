param (
    [string]$task = "active"
)

if ($task -eq "active") {
    # run commands to activate virtual environment
    $env:PYTHONPATH = "$env:PYTHONPATH;$pwd"
    .\venv\Scripts\activate
} elseif ($task -eq "make") {
    # make virtual environment
    python -m venv ./venv
    $env:PYTHONPATH = "$env:PYTHONPATH;$pwd"
    .\venv\Scripts\activate
    python -m pip install --upgrade pip
    pip install poetry==1.6.1
    Remove-Item -Path 'poetry.lock' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'requirements.txt' -Force -ErrorAction SilentlyContinue
    poetry install
    poetry export --output requirements.txt
} elseif ($task -eq "clean") {
    # remove virtual environment to start over
    Remove-Item -Path ".\venv" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'poetry.lock' -Force -ErrorAction SilentlyContinue
    Remove-Item -Path 'requirements.txt' -Force -ErrorAction SilentlyContinue
} else {
    # invalid task argument
    Write-Host "Only active, make or clean are allowed as tasks"
}
