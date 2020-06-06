# Azure Functions profile.ps1
#
# This profile.ps1 will get executed every "cold start" of your Function App.
# "cold start" occurs when:
#
# * A Function App starts up for the very first time
# * A Function App starts up after being de-allocated due to inactivity
#
# You can define helper functions, run commands, or specify environment variables
# NOTE: any variables defined that are not environment variables will get reset after the first execution

# Authenticate with Azure PowerShell using MSI.
# Remove this if you are not planning on using MSI or Azure PowerShell.

if ($env:MSI_SECRET  -and ( Get-Module -ListAvailable Az.Accounts)) {
    Connect-AzAccount -Identity
}

# if ($env:Thumbprint) {
#     #Connect-AzAccount -Identity -AccountId 'fa12f82d-5408-4321-aa64-ae9c5110abb3'
#     $Thumbprint = $env:Thumbprint
#     $TenantId = $env:SP_Tenant 
#     $ApplicationId = $env:ApplicationId
#     Connect-AzAccount -CertificateThumbprint $Thumbprint -ApplicationId $ApplicationId -Tenant $TenantId -ServicePrincipal
# }

# Uncomment the next line to enable legacy AzureRm alias in Azure PowerShell.
# Enable-AzureRmAlias

# You can also define functions or aliases that can be referenced in any of your PowerShell functions.
