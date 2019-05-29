$thisdir = "C:\Users\laws.colin\Documents\Git"
. ($thisdir+"\Errorhandling.ps1")

$mydir = split-path $MyInvocation.InvocationName -Parent
$mydir
function CheckUpdates {
    $updatesession=(new-object -com "Microsoft.Update.Session")
    $updates = $updatesession.CreateupdateSearcher().Search("IsInstalled=0 and IsHidden=0").Updates | Select-Object Title
    $updates.title
    $updatesession.createDownloader
    read-host "Press enter to continue"
}