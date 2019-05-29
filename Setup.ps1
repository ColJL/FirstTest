$mydir = split-path $MyInvocation.InvocationName -Parent
$mydir
function CheckUpdates {
    $updatesession=(new-object -com "Microsoft.Update.Session")
    $updates = $updatesession.CreateupdateSearcher().Search("IsInstalled=0 and IsHidden=0").Updates
    $updates.title
    $updatesession.createupdatedownloader()
    read-host "Press enter to continue"
}

function NoEdge {
    $layoutpath= ($Env:LOCALAPPDATA) + "\Microsoft\Windows\Shell\"
    $layout = $layoutpath + "LayoutModification.xml"
    $outfile = $layoutpath +"test.txt"
    Get-Content $layout | Where-Object {($_ -notmatch 'Edge') -and ($_ -notmatch 'bing') -and ($_ -notmatch 'cortana')}  | Set-Content $outfile
    remove-Item $layout
    rename-item -force $outfile $layout
    #Copy-Item -Force $layout C:\Users\Default\AppData\Local\Microsoft\Windows\Shell
    Start-Process powershell -ArgumentList "\\welwms15\archive\programs\powershell\removedefaults.ps1" -verb runas
}
NoEdge
CheckUpdates
