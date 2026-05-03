# export.ps1 — packages only the files needed to run Note Quiz
# Output: Note-Quiz.zip in the folder above this one

$source = $PSScriptRoot
$dest   = Split-Path $source -Parent
$zip    = Join-Path $dest "Note-Quiz.zip"

$files = @(
    "note-quiz.html",
    "README.md",
    "start.bat",
    "start.ps1",
    ".gitignore",
    "SalamanderGrandPiano\C4v8.wav",
    "SalamanderGrandPiano\D#4v8.wav",
    "SalamanderGrandPiano\F#4v8.wav",
    "SalamanderGrandPiano\A4v8.wav",
    "SalamanderGrandPiano\C5v8.wav",
    "SalamanderGrandPiano\D#5v8.wav",
    "SalamanderGrandPiano\F#5v8.wav",
    "SalamanderGrandPiano\A5v8.wav"
)

if (Test-Path $zip) { Remove-Item $zip }

Add-Type -AssemblyName System.IO.Compression.FileSystem
$archive = [System.IO.Compression.ZipFile]::Open($zip, 'Create')

foreach ($f in $files) {
    $full = Join-Path $source $f
    if (Test-Path $full) {
        $entry = $f.Replace('\', '/')
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
            $archive, $full, "Note-Quiz/$entry") | Out-Null
        Write-Host "  added $f"
    } else {
        Write-Warning "  skipped (not found): $f"
    }
}

$archive.Dispose()
Write-Host ""
Write-Host "Done: $zip"
