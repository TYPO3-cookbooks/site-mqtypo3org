include_recipe "rabbitmq"

include_recipe "rabbitmq::plugin_management"
include_recipe "rabbitmq::user_management"
include_recipe "rabbitmq::mgmt_console"


####################################
# RabbitMQ users
####################################

# look in the "users" data bag for all entries having a "rabbitmq" key and process them

search("users", "*:*").reject{ |user| user['rabbitmq'].nil? }.each do |user|
  Chef::Log.info "Found user #{user['id']} as rabbitmq user"

  myself = node[:"site-mqtypo3org"][:hostname]

  include_recipe "chef-vault::default"
  password = chef_vault_password(myself, user['id'])

  rabbitmq_user user['id'] do
    password password
    action :add
  end
  rabbitmq_user user['id'] do
    tag user['rabbitmq']['tag']
    action :set_tags
  end
  user['rabbitmq']['rights'].each  do |r|
    rabbitmq_user user['id'] do
      vhost r['vhost']
      permissions "#{r['conf']} #{r['write']} #{r['read']}"
      action :set_permissions
    end
  end

end

include_recipe "site-mqtypo3org::proxy"
