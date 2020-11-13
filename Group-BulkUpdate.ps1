write-host "$(date) Get ObjectIDs of all active users"

$people=Search-Resources -XPath "/Person[AccountType='Individual' and EmployeeStatusCode=3]" -AttributesToGet EmployeeID



$name="GS-KOD-RO-kodgroup5"



$users=Import-Csv C:\Powershell\sam2.txt

write-host "$(date) Get Group $($name)"

try {

    $group=Get-Resource -ObjectType Group -AttributeName DisplayName -AttributeValue $name

    write-host "$(date) Add Users"

    for ($i = 0; $i -lt $users.Count; $i++)

    { 

        $j=[array]::IndexOf($people.EmployeeID,$users[$i].SamAccountName)

        if ($j -gt -1){

            $return=$group.ExplicitMember.Add($people[$j].ObjectID)

        }

        if (($i % 250 -eq 0) -and ($i -ne 0)){

            write-host "$(date) Saving 250 of $($users.count), $($i) users processed"

            try{

                Save-Resource $group

            }catch{

                $return=0

            }

            start-sleep -Seconds 300

        }

    }

    write-host "$(date) Saving 250 of $($users.count), $($i) users processed"

    Save-Resource $group

}catch{

    write-host "$(date) $($Group) not found" -ForegroundColor Yellow

}

