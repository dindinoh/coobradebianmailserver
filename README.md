Description
===========

Coobras automatic debian mailserver setup.

Requirements
============
Chef
run: curl -L https://www.opscode.com/chef/install.sh | sudo bash

Attributes
==========
Only edits in recipes/default.rb should be needed.

Usage
=====
chef-solo -c solo.rb -o coobramailserver::default

