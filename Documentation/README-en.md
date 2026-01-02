# Deep Freeze Silent Install via PowerShell

This document provides a credential‑aware, silent installation workflow for deploying **Deep Freeze** from a secured network share. The script mounts the installer directory as a temporary PowerShell drive and executes the installer with unattended parameters.

---

## Prerequisites

Before running the script, ensure:

- You have valid **Domain\Username** and **Password** credentials  
- You have access to the network share hosting `Deepfreeze.exe`  
- PowerShell is running with sufficient privileges to install software  
- The Deep Freeze installer supports the `/Install` argument for silent deployment  

---

## Usage

Replace the placeholder values with your own:

```powershell
$Username = [Domain\Username]
$Password = [Password]

$SecurePassword = ConvertTo-SecureString -String $Password -AsPlainText -Force

$Credential = New-Object 'System.Management.Automation.PSCredential' -ArgumentList @($Username, $SecurePassword)

$WebServer = New-PSDrive -Credential $Credential -Name 'DeepfreezeDistribution' -PSProvider 'FileSystem' -Root [\\FileShare\Directory]

Start-Process -FilePath 'DeepfreezeDistribution:\Deepfreeze.exe' -ArgumentList @('/Install') -NoNewWindow
