#Requires -Version 5.0
<#
.SYNOPSIS
  Safe read-only wake diagnostics for the mouse-battery workshop.

.DESCRIPTION
  Prints wake_armed devices and last wake source.
  Does NOT change power settings, registry, or devices.

.NOTES
  Path: D:\workshops\mouse-battery-fromzero\scripts\check-wake.ps1
#>

$ErrorActionPreference = 'Continue'

Write-Host ''
Write-Host '=== mouse-battery-fromzero :: check-wake (read-only) ===' -ForegroundColor Cyan
Write-Host ("Time: {0}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'))
Write-Host ("User: {0}" -f $env:USERNAME)
Write-Host ("PC:   {0}" -f $env:COMPUTERNAME)
Write-Host ''

Write-Host '--- powercfg -devicequery wake_armed ---' -ForegroundColor Yellow
try {
  $armed = & powercfg.exe -devicequery wake_armed 2>&1
  if (-not $armed -or ($armed -join '').Trim() -eq '') {
    Write-Host '(empty list or no wake-armed devices reported)'
  } else {
    $armed | ForEach-Object { Write-Host $_ }
  }
} catch {
  Write-Host ("ERROR running wake_armed: {0}" -f $_.Exception.Message) -ForegroundColor Red
}

Write-Host ''
Write-Host '--- powercfg -lastwake ---' -ForegroundColor Yellow
try {
  $last = & powercfg.exe -lastwake 2>&1
  if (-not $last -or ($last -join '').Trim() -eq '') {
    Write-Host '(no lastwake data)'
  } else {
    $last | ForEach-Object { Write-Host $_ }
  }
} catch {
  Write-Host ("ERROR running lastwake: {0}" -f $_.Exception.Message) -ForegroundColor Red
}

Write-Host ''
Write-Host '--- optional: USB controllers (names only) ---' -ForegroundColor Yellow
try {
  Get-PnpDevice -Class 'USB' -Status OK -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty FriendlyName |
    Sort-Object -Unique |
    ForEach-Object { Write-Host $_ }
} catch {
  Write-Host 'Could not list USB device names (optional section skipped).'
}

Write-Host ''
Write-Host 'Done. Copy output into notes.txt for homework.' -ForegroundColor Green
Write-Host 'This script changed nothing.' -ForegroundColor Green
Write-Host ''
