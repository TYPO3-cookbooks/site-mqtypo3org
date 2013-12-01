# make sure that there's no guest account!
override[:rabbitmq][:enabled_users] = []
override[:rabbitmq][:disabled_users] = ['guest']

override[:rabbitmq][:virtualhosts] = ['infrastructure', 'infrastructure_dev']

default[:'site-mqtypo3org'][:hostname] = 'mq.typo3.org'
default[:'site-mqtypo3org'][:proxy][:hostname] = 'mq.typo3.org'
default[:'site-mqtypo3org'][:proxy][:ssl] = true
default[:'site-mqtypo3org'][:proxy][:ssl_certificate] = 'wildcard.typo3.org'
