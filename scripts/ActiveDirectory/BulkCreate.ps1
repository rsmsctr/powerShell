import-module ActiveDirectory
$users = import-csv C:\users.csv


ForEach ($User in $Users){
    $ADUserParams = @{
        'SamAccountName' = $user.samname
        'UserPrincipalName' = "$($user.samname)@domain.com"
        'GivenName' = $user.firstname
        'SurName' = $user.lastname
        'EmailAddress' = "$($user.samname)@domain.com"
        'Path' = "OU="
        'Department' = "IT"
        'Company' = "company"
        'AccountPassword' = (ConvertTo-SecureString -AsPlainText $user.password -Force)
        'ChangePasswordAtLogon' = $false
        'Enabled' = $true
        'DisplayName' = "$($user.fullname)"
        'Name' = "$($user.fullname)"
        'Description' = "description"
        'Manager' = $DN
    }
    New-ADUser @ADUserParams
}