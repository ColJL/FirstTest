. C:\Users\laws.colin\Documents\Git\ErrorHandling.ps1

$usertemp=$env:TEMP
$wintemp = $env:windir +"\temp"
$updates = $env:windir +"\softwaredistribution"
function DelFiles {
    param (
        [string]$path
    )
    $files=""
    try {
        $files = Get-ChildItem -path $path -File -Recurse -ErrorAction Stop
    } catch {
        $msg = "Failed to list files in " + $path
        myerr -msg $msg
    }
    foreach ($file in $files){
        try {
            remove-Item -path $file.FullName -ErrorAction Stop
        }catch{
            # $_.exception
            $msg = "Failed to delete " + $file.FullName
            MyErr -msg $msg
        }
    }
}
DelFiles -path $usertemp
DelFiles -path $wintemp
delfiles -path $updates