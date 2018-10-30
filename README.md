# terragrunt-bootstrap

Downloads and installs Terragrunt on Linux/Mac.

This script should install the latest version of Terragrunt specific to your Linux-like / Mac system. If it doesn't work, 
please open an issue or, better yet, a pull request with the fix.

Installing Terragrunt's latest version is simple.

```shell
$ git clone https://github.com/plus3it/terragrunt-bootstrap.git
$ cd terragrunt-bootstrap && chmod +x install.sh && ./install.sh
```

The script will attempts multiple install locations. If you want the
broadest installation, you can `sudo` the script.

This is the typical output you might expect.
```shell
$ git clone https://github.com/plus3it/terragrunt-bootstrap.git
Cloning into 'terragrunt-bootstrap'...
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (5/5), done.
remote: Total 55 (delta 0), reused 3 (delta 0), pack-reused 50
Unpacking objects: 100% (55/55), done.
$ cd terragrunt-bootstrap
$ chmod +x install.sh
$ ./install.sh
terragrunt Bootstrap
https://github.com/plus3it/terragrunt-bootstrap
------------------------------------------------
Latest Terragrunt version is 0.17.1
Your platform is linux (Linux)
Your processor is amd64 (x86_64)
Downloading terragrunt from github...
https://github.com/gruntwork-io/terragrunt/releases/download/v0.17.1/terragrunt_linux_amd64
Installing Terragrunt...
terragrunt is available on your current path.
terragrunt was installed at /usr/local/bin/terragrunt.
```
