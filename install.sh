#!/bin/bash

echo "Terragrunt Bootstrap"
echo "https://github.com/plus3it/terragrunt-bootstrap"
echo "------------------------------------------------"

# get the latest version -----------------------------
latest_github_release=https://github.com/gruntwork-io/terragrunt/releases/latest

latest_url=$(curl -LIs -o /dev/null -w %{url_effective} $latest_github_release)
latest_version=${latest_url##*/}

if [[ $latest_version == v* ]]; then
  # strip the v off
  latest_version=${latest_version#*v}
fi

echo "Latest Terragrunt version is $latest_version"

# get the platform -----------------------------------
platform=$(uname | tr '[:upper:]' '[:lower:]')
case $platform in
  darwin|freebsd|openbsd|solaris) echo "Platform specific download exists";;
  *)                              platform=linux;;
esac

echo "Your platform is $platform ($(uname))"

# get the processor ----------------------------------
processor=$(uname -m)
case "$processor" in
  x86_64      )   processor=amd64;;
  arm*        )   processor=arm;;
  *           )   processor=386;;
esac

echo "Your processor is $processor ($(uname -m))"

# download -------------------------------------------
echo "Downloading terragrunt from github..."

# curl -Lso terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v${latest_version}/terragrunt_${platform}_${processor}
curl -Lso terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.18.7/terragrunt_${platform}_${processor}


# Install --------------------------------------------
echo "Installing Terragrunt..."

chmod +x terragrunt

success=0

# try /usr/local/bin first
install_location=/usr/local/bin
if [ -d $install_location ]; then
  mv -f terragrunt $install_location \
    && success=1
fi

# if that fails, try $HOME/bin
if [ $success -eq 0 ]; then
  install_location=$HOME/bin
  mkdir -p $install_location \
    && mv -f terragrunt $install_location \
    && success=1
fi

if [ $success -eq 1 ]; then
  # successfully installed so check path
  found=0
  echo "$PATH" | grep -q $install_location && found=1
  if [ $found -eq 0 ]; then
    echo "WARNING: terragrunt was not installed to a location in your path."
    echo "If you want terragrunt to be available in subsequent sessions, add "
    echo "$install_location to the path in .profile, .bash_profile or "
    echo "/etc/profile."

    # add terragrunt to path for current session
    export PATH=${PATH}:$install_location
  else
    echo "terragrunt is available on your current path."
  fi

  echo "terragrunt was installed at $install_location/terragrunt."

  exit 0

else
  # wasn't installed
  echo "ERROR: terragrunt was not installed."

  exit 1
fi
