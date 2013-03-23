# make sure that there's no guest account!
normal[:rabbitmq][:enabled_users] = []
normal[:rabbitmq][:disabled_users] = ['guest']

normal[:rabbitmq][:virtualhosts] = ['infrastructure', 'infrastructure_dev']

normal[:rabbitmq][:ssl] = true