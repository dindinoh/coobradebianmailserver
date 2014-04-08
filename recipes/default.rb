#
# Cookbook Name:: coobramailserver
# Recipe:: default
#
# Copyright 2014, COOBRA
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

bash "update" do
  user "root"
  code <<-EOF
apt-get update
EOF
end

bash "create cert" do
  user "root"
  code <<-EOF
echo "echo -e "SE\n\n\n\n\n\n\n"" | sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/mail.key -out /etc/ssl/certs/mailcert.pem
EOF
 not_if { ::File.exists?("/etc/ssl/private/mail.key") }
end

package "postfix"

service "postfix" do
  action :stop
end

