using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

#region dreidel options array
$Dreidel = @{
    'Nun'    = 'נ';
    'Gimmel' = 'ג';
    'Hay'    = 'ה';
    'Shin'   = 'ש'
}
#endregion

#region random dreidel
$Random = Get-Random -InputObject $($Dreidel.GetEnumerator())
#endregion

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = [HttpStatusCode]::OK
        Body       = $Random
    })
