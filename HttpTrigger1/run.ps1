using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$name = $Request.Query.Name
if (-not $name) {
    $name = $Request.Body.Name
}

#$passwd = ConvertTo-SecureString 'Hq-swxp202006.' -AsPlainText -Force
#$pscredential = New-Object System.Management.Automation.PSCredential('javendanob@intergrupo.com', $passwd)

$cuerpo = Get-AzResourceGroup -Name "SEWin10" | Select-Object ResourceGroupName

if ($cuerpo.length -gt 0)
    {
        echo 'encontrado'
        echo $cuerpo
        break
    }
$body=""


# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})
