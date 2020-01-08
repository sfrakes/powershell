$Certs = Get-Childitem "C:\Certs"
foreach ($cert in $certs) {
	Import-Certificate -Filepath "c:\Certs\$cert" -CertStoreLocation cert:\LocalMachine\Root
		
	}

