$ouPath = 'OU=Users,OU=CORP,DC=corp,DC=local'
$groupName = 'G-RU-MOW-KSCUser'
$usersInOU = Get-ADUser -Filter * -SearchBase $ouPath
$groupMembers = Get-ADGroupMember -Identity $groupName
$usersNotInGroup = @()

foreach ($user in $usersInOU) {
    if ($groupMembers | Where-Object { $_.SamAccountName -eq $user.SamAccountName }) {
        continue
    }
    $usersNotInGroup += $user
}

$usersNotInGroup | Select-Object Name