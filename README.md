# 25daysofserverless
Repo to store 25daysofserverless challenges

# How to use this function?

1. Clone Repository
2. Install the Azure Functions Core Tools
3. Run functions locally

1. Clone Repository
```PowerShell
git clone 'https://github.com/stefanstranger/25daysofserverless.git'
```

2. Install the Azure Core Tools
```PowerShell
choco install azure-functions-core-tools
```

3. Run functions locally
```PowerShell
cd .\dayminuseleven
func start --build
```

Open new PowerShell Host and type:
```PowerShell
Invoke-RestMethod -Method Get -Uri 'http://localhost:7071/api/GetGift?Name=Stefan'
```