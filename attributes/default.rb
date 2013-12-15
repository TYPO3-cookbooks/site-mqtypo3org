override[:rabbitmq][:version] = "3.2.2"
override[:rabbitmq][:package] = "https://www.rabbitmq.com/releases/rabbitmq-server/v#{node['rabbitmq']['version']}/rabbitmq-server_#{node['rabbitmq']['version']}-1_all.deb"

# make sure that there's no guest account!
override[:rabbitmq][:enabled_users] = []
override[:rabbitmq][:disabled_users] = ['guest']

override[:rabbitmq][:virtualhosts] = ['infrastructure', 'infrastructure_dev']

default[:'site-mqtypo3org'][:hostname] = 'mq.typo3.org'
default[:'site-mqtypo3org'][:proxy][:hostname] = 'mq.typo3.org'
default[:'site-mqtypo3org'][:proxy][:ssl] = true
default[:'site-mqtypo3org'][:proxy][:ssl_certificate] = 'wildcard.typo3.org'
