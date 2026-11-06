# ============================================================================
# 🦀 NALA-Strata-RS (v0.2.11-nala.6.6.6) — 5-Language Windows PowerShell Installer
# ============================================================================
#   irm https://github.com/Master-MD/NALA-Strata-RS/releases/latest/download/install.ps1 | iex
# ============================================================================
$ErrorActionPreference = 'Stop'
$Feed = if ($env:STRATA_FEED) { $env:STRATA_FEED.TrimEnd('/') } else { 'https://github.com/Master-MD/NALA-Strata-RS/releases/latest/download' }
$DataDir = if ($env:STRATA_DATA_DIR) { $env:STRATA_DATA_DIR } else { Join-Path $env:LOCALAPPDATA 'Strata' }

Write-Host "🦀 Installing NALA-Strata-RS v0.2.11-nala.6.6.6 (100% Native Rust-Turbo, Zero-Python / DE•FR•IT•RM•EN)..." -ForegroundColor Cyan

$TmpDir = Join-Path ([System.IO.Path]::GetTempPath()) ("nala_strata_" + [Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $TmpDir | Out-Null

try {
    $ManifestFile = Join-Path $TmpDir "install-manifest.txt"
    Invoke-WebRequest -Uri "$Feed/install-manifest.txt" -OutFile $ManifestFile -UseBasicParsing
    $Line = Get-Content $ManifestFile | Where-Object { $_ -match '^windows-x86_64 ' } | Select-Object -First 1
    if (-not $Line) { throw "No windows-x86_64 entry found in install-manifest.txt" }
    $Parts = $Line -split '\s+'
    $Ver = $Parts[1]
    $Archive = $Parts[2]
    $ExpectedSha = $Parts[3]

    $ZipFile = Join-Path $TmpDir $Archive
    Invoke-WebRequest -Uri "$Feed/$Archive" -OutFile $ZipFile -UseBasicParsing
    $ActualSha = (Get-FileHash -Path $ZipFile -Algorithm SHA256).Hash.ToLower()
    if ($ActualSha -ne $ExpectedSha.ToLower()) {
        throw "SHA-256 mismatch for $Archive"
    }

    $Dest = Join-Path $DataDir "terminal\$Ver"
    New-Item -ItemType Directory -Force -Path $Dest | Out-Null
    Expand-Archive -Path $ZipFile -DestinationPath $Dest -Force

    & (Join-Path $Dest "bin\strata.exe") update --check
    Write-Host "✅ Installed! Run: nala-strata-rs.exe launch" -ForegroundColor Green
} finally {
    Remove-Item -Recurse -Force -Path $TmpDir -ErrorAction SilentlyContinue
}
