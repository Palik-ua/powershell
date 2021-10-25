



# Set start mode to automatic
Set-Service WinRM -StartMode Automatic
# Verify start mode and state - it should be running
Get-WmiObject -Class win32_service | Where-Object {$_.name -like "WinRM"}

# Trust all hosts
#Set-Item WSMan:localhost\client\trustedhosts -value *

# Trust all subnet hosts
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "192.168.20.*" -Force


# Trust one host
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "192.168.20.82" -Force

# Verify trusted hosts configuration
Get-Item WSMan:\localhost\Client\TrustedHosts


Enable-PSRemoting -Force -SkipNetworkProfileCheck
#winrm set winrm/config/client '@{TrustedHosts="192.168.20.82,192.168.20.*"}'

netsh firewall set service type = remoteadmin mode = enable

set-executionpolicy unrestricted

Register-PSSessionConfiguration -Name Microsoft.PowerShell 
