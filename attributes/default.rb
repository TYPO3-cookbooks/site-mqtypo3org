default[:rabbitmq][:version] = "3.2.2"
default[:rabbitmq][:package] = "https://www.rabbitmq.com/releases/rabbitmq-server/v#{node[:rabbitmq][:version]}/rabbitmq-server_#{node[:rabbitmq][:version]}-1_all.deb"

# make sure that there's no guest account!
default[:rabbitmq][:enabled_users] = []
default[:rabbitmq][:disabled_users] = ["guest"]

default[:rabbitmq][:virtualhosts] = ["infrastructure", "infrastructure_dev"]

default[:rabbitmq][:ssl] = true
default[:rabbitmq][:ssl_cert] = "/etc/ssl_certs/wildcard.typo3.org.crt"
default[:rabbitmq][:ssl_key] = "/etc/ssl_certs/wildcard.typo3.org.key"

default[:'site-mqtypo3org'][:hostname] = "mq.typo3.org"
default[:'site-mqtypo3org'][:proxy][:hostname] = "mq.typo3.org"
default[:'site-mqtypo3org'][:proxy][:ssl] = true
default[:'site-mqtypo3org'][:proxy][:ssl_certificate] = "wildcard.typo3.org"

# this is a bit hacky, but only needed for Debian Squeeze. We need the correct version here for
# zabbix-custom-checks. See https://github.com/TYPO3-cookbooks/zabbix-custom-checks/commit/00f8035ba8a092dabd6201c3c3759a58ba8100c4
default['nginx']['version'] = "0.7.67"