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
    pip install poetry==1.4.0
    poetry install --with dev
} elseif ($task -eq "clean") {
    # remove virtual environment to start over
    Remove-Item -Path ".\venv" -Recurse -Force
} else {
    # invalid task argument
    Write-Host "Only active, make or clean are allowed as tasks"
}
