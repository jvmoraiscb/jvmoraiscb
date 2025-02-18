# SSH on Windows

Start the SSH agent in an admin PowerShell terminal:

```ps1
Set-Service ssh-agent -StartupType Automatic
Start-Service ssh-agent
```

In another PowerShell terminal, generate your key pair and save it in the .ssh folder:

```ps1
ssh-keygen
<path\to\your\user\.ssh\your_key_name>
```

Finally, create a config file in the .ssh folder:

```
Host <your.host.endpoint>
	User git
	IdentityFile <path\to\your\user\.ssh\your_key_name>
	AddKeysToAgent yes
```
