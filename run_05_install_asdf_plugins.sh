#!/bin/sh

. ./.profile

# Add asdf plugins
while read plugin version
do
    if ! asdf plugin list | grep --silent $plugin
    then
        asdf plugin add $plugin
    else
        asdf plugin update $plugin
    fi
done < ~/.tool-versions

# FIXME: Once node plugin auto installs keys 
# Import the Node.js release team's OpenPGP keys to main keyring
# SEE: https://github.com/asdf-vm/asdf-nodejs/issues/138
$ASDF_DIR/plugins/nodejs/bin/import-release-team-keyring

# Install asdf packages
asdf install
