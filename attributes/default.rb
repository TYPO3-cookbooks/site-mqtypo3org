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
