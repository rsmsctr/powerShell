connect-microsoftteams

$termp = (Read-Host -Prompt "Please enter the UPN username of the user:")

$userteams = @(Get-Team -user $termp)

Foreach($userteam in $userteams){
    Remove-Teamuser -GroupID $($userteam.groupid) -user $termp
    Write-Output "$termp has been removed from $($userteam.displayname)"
}