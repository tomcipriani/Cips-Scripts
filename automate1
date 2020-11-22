#Onboarding Script

#Adds the Exchange 2010 Module, Active Directory Module
#add-pssnapin Microsoft.Exchange.Management.PowerShell.E2010
Import-Module ActiveDirectory

# Determines current path of the script
$ScriptPath = split-path -parent $MyInvocation.myCommand.Definition

# Imports the session of the ADM user, or someone who has permissions to run the commands
#$Prompt = read-host "Are you running this script as ADM? (If no, the script will automatically elevate) Y/N"
#if ($Prompt = "Y"){
#$ADMCred = Get-Credential
#}


#Get's user prompt
$UserFirstname = read-host "Enter the first name of the user whom you want to Onboard"
$UserLastname = Read-Host "Enter the last name of the user whom you want to Onboard"
$UserTitle = Read-Host "Enter the user's title indicated in the onboarding ticket"

#Get User's department
write-Host -foregroundcolor Blue "What Department is this computer going to be in?"
write-host -foregroundcolor Gray "
1>  CS          2>  Technology 
3>  Sales       4>  Product
5>  Support     6>  Accounting / Finance
7>  Marketing   8>  Operations / Help Desk
9>  EAS         "

$Department = read-host ">>"

#Translates that number into the actual name for ease of use
Switch ($Department){
    1 {$Department = "CS"}
    2 {$Department = "Technology"}
    3 {$Department = "Sales"}
    4 {$Department = "Product"}
    5 {$Department = "Support"}
    6 {$Department = "Accounting"}
    7 {$Department = "Marketing"}
    8 {$Department = "Operations"}
    9 {$Department = "EAS"}
    10 {$Department = "Finance"}
    11 {$Department = "Help Desk"}
    12 {$Department = "General"} }

<#
    Creates the User in the People OU with the info given, but doesn't add to group or set manager yet'
#>
$SAMAccountName = "$UserFirstname" + "." + "$UserLastname"

New-ADUser -Name "$UserFirstname $UserLastname" -GivenName "$UserFirstname" -Surname "$UserLastname" `
    -Path "OU=Users,DC=shikata,DC=com" `
    -UserPrincipalName ("$SAMAccountName" + '@' + "leonardo.com") `
    -AccountPassword (ConvertTo-SecureString -AsPlainText "p@ssw0rd" -force) `
    -SamAccountName "$SAMAccountName" `
    -Enabled $true `
    -Title "$UserTitle" `
    -DisplayName "$UserFirstname $UserLastname" `
    -Description "$UserTitle" `
    -Company "MyCompany" `
    -StreetAddress "MyAddress" `
    -Office "Toronto" `
    -City "Toronto" `
    -State "Ontario" `
    -PostalCode "A1A-1A1" `
    -Country "CA"
   
  

<#
    Add's User to the specified AD groups
       - Via. Text file in the same folder coresponding to what they picked
#>

switch($Department){
    "CS" {
            <#
              Adds the Manager of Customer Success <> to user profile
            #>
            $Manager = Get-ADUser -Identity "Firstname.Lastname"
            $User = Get-ADUser -Identity "$SAMAccountName"
            Set-ADUser -Identity $SAMAccountName -Manager "$Manager"

            # Add the groups for the user (off of a template text file)
            $Groups = Get-content "$ScriptPath\CS.txt"
            foreach ($Group in $Groups){
                Add-ADGroupMember -Identity "$Group" -Members "$User"
                }
        }
    "Technology" {
                    <#
                        Adds the Manager of Technology <> to user profile
                    #>
                    $Manager = Get-ADUser -Identity "Firstname.Lastname"
                    $User = Get-ADUser -Identity "$SAMAccountName"
                    Set-ADUser -Identity $SAMAccountName -Manager "$Manager"

                    # Add the groups for the user (off of a template text file)
                    $Groups = Get-content "$ScriptPath\Technology.txt"
                    foreach ($Group in $Groups){
                        Add-ADGroupMember -Identity "$Group" -Members "$User"
                        }
                 }
    "Sales" {
            <#
              Adds the Manager of Sales <> to user profile
            #>
            $Manager = Get-ADUser -Identity "Firstname.Lastname"
            $User = Get-ADUser -Identity "$SAMAccountName"
            Set-ADUser -Identity $SAMAccountName -Manager "$Manager"

            # Add the groups for the user (off of a template text file)
            $Groups = Get-content "$ScriptPath\Sales.txt"
            foreach ($Group in $Groups){
                Add-ADGroupMember -Identity "$Group" -Members "$User"
                }
        }

    "Product" {
            <#
              Adds the Manager of Product <> to user profile
            #>
            $Manager = Get-ADUser -Identity "Firstname.Lastname"
            $User = Get-ADUser -Identity "$SAMAccountName"
            Set-ADUser -Identity $SAMAccountName -Manager "$Manager"

            # Add the groups for the user (off of a template text file)
            $Groups = Get-content "$ScriptPath\Product.txt"
            foreach ($Group in $Groups){
                Add-ADGroupMember -Identity "$Group" -Members "$User"
                }
        }
    "Support" {
            <#
              Adds the Manager of Support <> to user profile
            #>
            $Manager = Get-ADUser -Identity "Firstname.Lastname"
            $User = Get-ADUser -Identity "$SAMAccountName"
            Set-ADUser -Identity $SAMAccountName -Manager "$Manager"

            # Add the groups for the user (off of a template text file)
            $Groups = Get-content "$ScriptPath\Support.txt"
            foreach ($Group in $Groups){
                Add-ADGroupMember -Identity "$Group" -Members "$User"
                }
        }

    "Accounting" {
            <#
              Adds the Manager of Customer Success <> to user profile
            #>
            $Manager = Get-ADUser -Identity "Firstname.Lastname"
            $User = Get-ADUser -Identity "$SAMAccountName"
            Set-ADUser -Identity $SAMAccountName -Manager "$Manager"

            # Add the groups for the user (off of a template text file)
            $Groups = Get-content "$ScriptPath\Accounting.txt"
            foreach ($Group in $Groups){
                Add-ADGroupMember -Identity "$Group" -Members "$User"
                }
        }

    "Marketing" {
            <#
              Adds the Manager of Marketing <> to user profile
            #>
            $Manager = Get-ADUser -Identity "Firstname.Lastname"
            $User = Get-ADUser -Identity "$SAMAccountName"
            Set-ADUser -Identity $SAMAccountName -Manager "$Manager"

            # Add the groups for the user (off of a template text file)
            $Groups = Get-content "$ScriptPath\Marketing.txt"
            foreach ($Group in $Groups){
                Add-ADGroupMember -Identity "$Group" -Members "$User"
                }
        }

    "Operations" {
            <#
              Adds the Manager of Customer Success <> to user profile
            #>
            $Manager = Get-ADUser -Identity "Firstname.Lastname"
            $User = Get-ADUser -Identity "$SAMAccountName"
            Set-ADUser -Identity $SAMAccountName -Manager "$Manager"

            # Add the groups for the user (off of a template text file)
            $Groups = Get-content "$ScriptPath\Operations.txt"
            foreach ($Group in $Groups){
                Add-ADGroupMember -Identity "$Group" -Members "$User"
                }
        }

    "EAS" {
            <#
              Adds the Manager of Customer Success <> to user profile
            #>
            $Manager = Get-ADUser -Identity "Firstname.Lastname"
            $User = Get-ADUser -Identity "$SAMAccountName"
            Set-ADUser -Identity $SAMAccountName -Manager "$Manager"

            # Add the groups for the user (off of a template text file)
            $Groups = Get-content "$ScriptPath\EAS.txt"
            foreach ($Group in $Groups){
                Add-ADGroupMember -Identity "$Group" -Members "$User"
                }
        }
}
