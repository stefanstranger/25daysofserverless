Little Elsie has a problem.

She wants to tell Santa about the things she wants as gifts, but she is out of both paper, pencils, 
and stamps to write a quick letter! Wouldn't it be easier if she could create an API to allow Santa to access her requests?

# How to use this function?

1. Clone Repository
2. Install the Azure Functions Core Tools
3. Run functions locally

Step 1. Clone Repository

```PowerShell
git clone 'https://github.com/stefanstranger/25daysofserverless.git'
```

Step 2. Install the Azure Core Tools

```PowerShell
choco install azure-functions-core-tools
```

Step 3. Run functions locally

```PowerShell
cd .\dayminuseleven
func start --build
```

Open new PowerShell Host and type:

```PowerShell
Invoke-RestMethod -Method Get -Uri 'http://localhost:7071/api/GetGift?Name=Stefan'
```
