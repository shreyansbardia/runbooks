$myCred = Get-AutomationPSCredential -Name 'aztestupn'
$userName = $myCred.UserName
$securePassword = $myCred.Password
$tenantid = "2fa2ec5a-717a-4157-8e6c-f3ec61fed660"
$SubId ="20e72d75-9745-4199-8690-57da92e07675"
[string][ValidateNotNullOrEmpty()]$password = $myCred.GetNetworkCredential().Password


$myPsCred = New-Object System.Management.Automation.PSCredential ($userName,$securePassword)

Connect-AzureRmAccount -Credential $myPsCred -ServicePrincipal -Tenant $tenantid

Get-AzureRmResourceGroup | Remove-AzureRmResourceGroup -Verbose -Force
