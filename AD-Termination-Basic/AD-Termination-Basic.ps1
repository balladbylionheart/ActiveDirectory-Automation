################################################################################
# Script: AD-Termination-Basic.ps1
# Author: Helen Najar, Lionheart | Ballad by Dragons
# Description: Active Directory-only termination script (no Exchange/Hybrid steps)
# Date: 2025-05-19
################################################################################

# Import Active Directory Module
Import-Module ActiveDirectory
Add-Type -Assembly 'System.Web'

Write-Host " "
Write-Host "========================================================" -ForegroundColor Yellow
Write-Host "    Welcome to the Termination in Active Directory     " -ForegroundColor Green
Write-Host "========================================================" -ForegroundColor Yellow
Write-Host "        Standard AD Termination Script Launched        " -ForegroundColor Green
Write-Host "========================================================" -ForegroundColor Yellow
Write-Host " "

# Validate User Input & AD Lookup
do {
    $username = Read-Host "Enter User's LAN ID"

    if ([string]::IsNullOrWhiteSpace($username) -or $username -match '[$!~#%&*{}\\:<>?/|+\"@_]') {
        Write-Warning "Invalid input detected. Please enter a valid LAN ID."
        continue
    }

    $user = Get-ADUser -Filter { SamAccountName -eq $username } -Properties SamAccountName, MemberOf, Description

    if (-not $user) {
        Write-Warning "User '$username' not found in Active Directory. Please double-check the username and try again."
    }
} until ($user)

$username = $user.SamAccountName
$date = Get-Date -DisplayHint Date

# Validate Ticket Number Format
do {
    $ticketnumber = Read-Host "Enter Ticket Number (e.g., REQ1234567)"
    $ticketnumber = $ticketnumber.ToUpper()
    if ($ticketnumber -match '^REQ\d{7}$') { break }
    else { Write-Warning "Invalid format. Use 'REQ' followed by 7 digits." }
} while ($true)

$FullDesc = "Disabled on $date per $ticketnumber"

# Generate Secure Password
function GeneratePassword([int32]$PasswordLength = 22) {
    $charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*"
    -join (1..$PasswordLength | ForEach-Object { Get-Random -InputObject $charSet.ToCharArray() })
}

$passW = GeneratePassword | ConvertTo-SecureString -AsPlainText -Force

# Primary Group and Membership Cleanup
Write-Host "`nGathering MemberOf..."
$user.MemberOf | Get-ADGroup | Select-Object Name

Write-Host "Ensuring 'Domain Users' is the Primary AD Group..."
$group = Get-ADGroup "Domain Users" -Properties primaryGroupToken
Set-ADUser -Identity $username -Replace @{primaryGroupID=$group.primaryGroupToken}
Write-Host "'Domain Users' set as the Primary Group - COMPLETED"

Write-Host "`nSetting New Password..."
Set-ADAccountPassword -Identity $username -Reset -NewPassword $passW
Write-Host "New Password Set - COMPLETED"

Write-Host "`nRemoving Group Memberships..."
$user.MemberOf | ForEach-Object { Remove-ADGroupMember -Identity $_ -Members $username -Confirm:$false }
Write-Host "Group Memberships Removed - COMPLETED"

Write-Host "Updating Description Field..."
$UpdatedDesc = "$FullDesc - $($user.Description)"
Set-ADUser -Identity $username -Description $UpdatedDesc
Write-Host "Description Field Updated - COMPLETED"

Write-Host "Disabling Account..."
Set-ADUser -Identity $username -Enabled $false
Write-Host "Account Disabled - COMPLETED"

Write-Host "Moving account to Disabled OU..."
Move-ADObject -Identity $user.DistinguishedName -TargetPath 'OU=Disabled Objects,DC=yourdomain,DC=com'
Write-Host "Moved to Disabled OU - COMPLETED"

# Final Prompt
Write-Host "`nPlease document this action with screenshots or logs."
do {
    $answer = Read-Host "Press 'y' when done or 'n' to exit"
} until ($answer -match '^[YyNn]$')

if ($answer -match '^[Nn]$') {
    Write-Host "Exiting script..." -ForegroundColor Cyan
}
