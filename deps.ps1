# Check to see if we are currently running "as Administrator"
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    exit
}

# Update Help for Modules
Write-Host "Updating Help..." -ForegroundColor "Yellow"
Update-Help -Force

# Install package providers
Write-Host "Installing Package Providers..." -ForegroundColor "Yellow"
Get-PackageProvider NuGet -Force | Out-Null

# Install PowerShell Modules
Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"
Install-Module Posh-Git -Scope CurrentUser -Force
Install-Module PSWindowsUpdate -Scope CurrentUser -Force

# Winget Package Installations
Write-Host "Installing Desktop Utilities..." -ForegroundColor Yellow

## Browsers
winget install --id Zen-Team.Zen-Browser --accept-package-agreements
winget install --id Valve.Steam --accept-package-agreements
winget install --id FxSound.FxSound --accept-package-agreements
winget install --id Microsoft.VisualStudioCode --accept-package-agreements
winget install --id Obsidian.Obsidian --accept-package-agreements
winget install --id Notion.Notion --accept-package-agreements

Write-Host "Installation completed!" -ForegroundColor Green