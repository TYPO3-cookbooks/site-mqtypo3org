# make sure that there's no guest account!
normal[:rabbitmq][:enabled_users] = []
normal[:rabbitmq][:disabled_users] = ['guest']

normal[:rabbitmq][:virtualhosts] = ['infrastructure', 'infrastructure_dev']

default['site-mqtypo3org'][:proxy][:hostname] = node[:fqdn]
default['site-mqtypo3org'][:proxy][:ssl] = true
default['site-mqtypo3org'][:proxy][:ssl_certificate] = nil
