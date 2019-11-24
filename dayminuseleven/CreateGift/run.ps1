using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$name = $Request.Query.Name
if (-not $Name) {
    $Name = $Request.Body.Name
}

$Gift = $Request.Query.Gift
if (-not $Gift) {
    $Gift = $Request.Body.Gift
}

if ($Name -and $Gift) {
    $status = [HttpStatusCode]::OK
    #region create new Git Object
    $GiftObject = [pscustomobject]@{
        'Name' = $name
        'Gift' = $Gift
    }
    #endregion

    #region add object to Gifts array
    $Gifts = Get-Content -Path .\sample.dat | ConvertFrom-Json

    $Gifts += $GiftObject
    $Gifts | Convertto-json | set-content -path  .\sample.dat -Force
    #endregion
    $body = ('Added Gift {0} to {1} Gifts list' -f $Gift, $Name)
}
else {
    $status = [HttpStatusCode]::BadRequest
    $body = "Please pass a name on the query string or in the request body."
}

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = $status
        Body       = $body
    })
