Connect-MgGraph -Scopes "User.ReadWrite.All"

$Guests = Get-MgUser -Filter "userType eq 'Guest'" -All -Property SignInActivity

foreach ($g in $Guests) {
    if ($g.SignInActivity.LastSignInDateTime -lt (Get-Date).AddDays(-90)) {
        Write-Host "Disabling $($g.UserPrincipalName)"
        Update-MgUser -UserId $g.Id -AccountEnabled:$false
    }
}
