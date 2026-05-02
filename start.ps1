# Note Quiz - Startup Script
# Ctrl+C to stop the server

$requiredMajor = 3
$requiredMinor = 6
$port = 8080

# Check for Python
try {
    $version = python --version 2>&1
} catch {
    Write-Host "ERROR: Python not found. Install it from https://python.org" -ForegroundColor Red
    exit 1
}

# Parse version
if ($version -match "Python (\d+)\.(\d+)") {
    $major = [int]$Matches[1]
    $minor = [int]$Matches[2]
    Write-Host "Found $version" -ForegroundColor Green

    if ($major -lt $requiredMajor -or ($major -eq $requiredMajor -and $minor -lt $requiredMinor)) {
        Write-Host "ERROR: Python $requiredMajor.$requiredMinor+ required (you have $major.$minor)" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "ERROR: Could not determine Python version." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Starting Note Quiz..." -ForegroundColor Cyan
Write-Host "Open your browser and go to: http://localhost:$port/note-quiz.html" -ForegroundColor Yellow
Write-Host "Press Ctrl+C to stop." -ForegroundColor Gray
Write-Host ""

Set-Location $PSScriptRoot
python -m http.server $port
