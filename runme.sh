#!/bin/bash

if [ ! -z $2 ]
then
    echo sudo apt-get -y install git
    echo cd ~
    git clone https://github.com/dindinoh/coobradebianmailserver.git
    sed -i -e 's/coobrauser/$2/g' coobradebianmailserver/recipes/default.rb
    sed -i -e 's/coobradomain/$1/g' coobradebianmailserver/recipes/default.rb
    echo "cookbook_path '$(pwd)/cookbooks'" > solo.rb
    curl -L https://www.opscode.com/chef/install.sh | sudo bash
    chef-solo -c ./solo.rb coobradebianmailserver::default
else
    echo "example: runme.sh maildomainname youruseraccountontheserver"
fi
