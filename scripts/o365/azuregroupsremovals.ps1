connect-azuread

$termp = (Read-Host -Prompt "Please enter the UPN username of the user:")

$O365ObjectID = (get-azureaduser -Filter "userprincipalname eq '$($termp)'").objectid
$Azuregroups = (Get-AzureADUserMembership -objectid $O365ObjectID | where-object {$_.DirSyncEnabled -like ""}).objectid

Foreach($azuregroup in $azuregroups){
        remove-AzureADGroupMember -ObjectID $azuregroup -memberID $o365ObjectID
}
