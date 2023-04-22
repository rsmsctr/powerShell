connect-msolservice

$termp = (Read-Host -Prompt "Please enter the UPN username of the user:")

$licenses = (get-msoluserlicense -userprincipalname $termp).licenses.accountskuID

foreach($license in $licenses){
    Set-MsolUserlicense -userprincipalname $termp -removelicenses $license
    write-host "$License has been removed from $termp account"
}