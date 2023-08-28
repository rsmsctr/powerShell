connect-azuread
connect-msolservice

$users = (get-azureaduser -all $true)

$hash = @{}

foreach($user in $users){
    $licenses = (get-msoluser -userprincipalname $user.userprincipalname).licenses.accountskuID
    $hash["$($user.mail)"] = "$($licenses)"
}

$hash.GetEnumerator() | Select-Object name, value | export-csv C:\temp