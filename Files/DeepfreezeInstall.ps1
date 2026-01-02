$Username = [Domain\Username]
$Password = [Password]

$SecurePassword = ConvertTo-SecureString -String $Password -AsPlainText -Force

$Credential =  New-Object 'System.Management.Automation.PSCredential' -ArgumentList @($Username, $SecurePassword)

$WebServer = New-PSDrive -Credential $Credential -Name 'DeepfreezeDistribution' -PSProvider 'FileSystem' -Root [\\FileShare\Directory]

Start-Process -FilePath 'DeepfreezeDistribution:\Deepfreeze.exe' -ArgumentList @('/Install') -NoNewWindow
