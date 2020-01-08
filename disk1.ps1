$computers =@("ashdc01","ashdc02")
$computers | foreach {
 $os = Get-WmiObject win32_OperatingSystem -computername $_
 Get-WMIObject Win32_Logicaldisk -filter "drivetype=3"-ComputerName $_
} | Select PSComputername,DeviceID,
@{Name="SizeGB";Expression={$_.Size/1GB -as [int]}},
@{Name="FreeGB";Expression={[math]::Round($_.Freespace/1GB,2)}} |
Sort FreeGB | Format-Table -Autosize