$processtack1 = "*Code*"
$processtack2 = "*OUTLOOK*"
$comutername = $env:COMPUTERNAME
$getdatetime = Get-Date -Format "MMddyyyyHHmm"
$process_elapsed_time_file_path = "C:\Temp\" + $comutername + "_PET_" + $getdatetime + ".csv"
$local_user_last_login_time_file_path = "C:\Temp\" + $comutername + "_LULLT_" + $getdatetime + ".csv"

Get-Process | Where-Object {($_.Name -like $processtack1) -or ($_.Name -like $processtack2)} |
Select-Object Name,@{label="Elapsed Time";expression={[System.Math]::Round(((Get-Date)-$_.StartTime).totalseconds)}} |
Export-Csv -Path $process_elapsed_time_file_path -NoTypeInformation

Get-LocalUser | Select-Object Name, Lastlogon |
Export-Csv -Path $local_user_last_login_time_file_path -NoTypeInformation