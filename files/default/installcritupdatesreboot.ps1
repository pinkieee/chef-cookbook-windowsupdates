# Thanks to eHow for providing the script framework
# http://www.ehow.com/how_8724332_use-powershell-run-windows-updates.html

function Get-WIAStatusValue($value)

{

switch -exact ($value)

{

0 {"NotStarted"}

1 {"InProgress"}

2 {"Succeeded"}

3 {"SucceededWithErrors"}

4 {"Failed"}

5 {"Aborted"}

}

}




$needsReboot = $false

$UpdateSession = New-Object -ComObject Microsoft.Update.Session

$UpdateSearcher = $UpdateSession.CreateUpdateSearcher()

Write-Host " - Searching for Updates"

$SearchResult = $updateSession.createupdatesearcher().search("isInstalled=0 and Type='Software'").Updates | Where-Object { $_.MsrcSeverity -eq "Critical" }

$noUpdateCounter = $SearchResult | Measure-Object | Where {$_.Count -eq 0}

if ($noUpdateCounter.count -eq 0){ Write-Host " - There are no applicable updates." }

else { 

Write-Host " - Found [$($SearchResult.count)] Updates to install"

foreach($Update in $SearchResult)

{


# Add Update to Collection

$UpdatesCollection = New-Object -ComObject Microsoft.Update.UpdateColl

if ( $Update.EulaAccepted -eq 0 ) { $Update.AcceptEula() }

$UpdatesCollection.Add($Update) 


# Install

if ($update.IsDownloaded -eq 1){

Write-Host " - Installing Update $($Update.Title)"

$UpdatesInstaller = $UpdateSession.CreateUpdateInstaller()

$UpdatesInstaller.Updates = $UpdatesCollection

$InstallResult = $UpdatesInstaller.Install()

$Message = " - Install {0}" -f (Get-WIAStatusValue $InstallResult.ResultCode)

Write-Host $message

Write-Host

$needsReboot = $installResult.rebootRequired

}
}

if($needsReboot) {restart-computer}

}
