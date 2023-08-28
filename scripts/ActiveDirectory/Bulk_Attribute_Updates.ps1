#Imports a CSV file and replaces Active Directory user Object attributes with a hash. 


$USERS = Import-CSV "C:\example.csv"

foreach($user in $users){
	if(Get-ADUser -Filter "samaccountname -eq '$($user.samaccountname)'"){
		$hash = @{"customAttribute1"=$user.Department}
		Set-ADUser $user.samaccountname -replace $hash
		Write-Host "Set $($user.SamAccountName) customAttribute1 to $($user.Department)"
		  }
	else{
	     Write-host "User not found $($user.samaccountname)"
		 add-content -path "C:\missedusers.txt" -value $user.samaccountname
	    }
}
