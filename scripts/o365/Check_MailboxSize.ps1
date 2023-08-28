$OUTable = @(get-aduser -Filter * -Properties mail -SearchBase "OU=Users" | Select-Object mail)

$users = $OUTable | Select-Object -ExpandProperty mail

foreach($user in $users){
        $mailboxsize = ((Get-EXOMailboxstatistics -Identity $user).totalitemsize.value.tobytes())
        if($mailboxsize -ge 90000000000){
            Write-Host "$user mailbox is greater than 90gb" -ForegroundColor Red
            Add-Content -path C:\over90gigs.txt -Value $user
            }
            Else{
            Write-Host "$user mailbox is less than 90gb"
            }
        }