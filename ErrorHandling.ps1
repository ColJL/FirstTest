function WriteLog {
	param ([string]$message,
		[int]$type,
        [string]$logfile)
	
	$Date = Get-Date -format g
	$str = "$Date - "
	
	switch ($type) {
		0 {
			$str += "INFO    $message"; $cmd = `Write-Host ` $str ` -ForegroundColor White`
		}
		1 {
			$str += "WARNING $message"; $cmd = `Write-Host ` $str ` -ForegroundColor Yellow`
		}
		2 {
			$str += "ERROR   $message"; $cmd = `Write-Host  ` $str ` -ForegroundColor Red`
		}
		default {
			$str += "INFO    $message"; $cmd = `Write-Host ` $str ` -ForegroundColor White`
		}
	}
	
	# Write output to console
#    $cmd
    if ($cmd) {
	    Invoke-Expression -Command $cmd
        }	

	# Write output to logfile if one has been specified
	if ($logfile) {
		Write-Output $str | Out-File $LogFile -Append
		}
}


# Define Log Functions
function MyInfo {
	param (
        [string]$msg,
        [string]$logfile
    )

    WriteLog $msg 0 $logfile
}
function MyWarn {
	param (
        [string]$msg,
        [string]$logfile
    )

    WriteLog $msg 1 $logfile
}
function MyErr {
	param (
        [string]$msg,
        [string]$logfile
    )

    WriteLog $msg 2 $logfile
}
#endregion