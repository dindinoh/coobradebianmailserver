#!/bin/bash

if [ ! -z $2 ]
then
    sudo apt-get -y install git
    git clone https://github.com/dindinoh/coobradebianmailserver.git
    sed -i -e "s/coobrauser/$2/g" coobradebianmailserver/recipes/default.rb
    sed -i -e "s/coobradomain/$1/g" coobradebianmailserver/recipes/default.rb
    mkdir cookbooks
    mv coobradebianmailserver cookbooks/
    echo "cookbook_path '$(pwd)/cookbooks'" > solo.rb
    curl -L https://www.opscode.com/chef/install.sh | sudo bash
    sudo chef-solo -c ./solo.rb -o coobradebianmailserver::default
else
    echo "example: runme.sh maildomainname youruseraccountontheserver"
fi
