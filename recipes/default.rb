include_recipe "rabbitmq"

include_recipe "rabbitmq::plugin_management"
include_recipe "rabbitmq::user_management"
include_recipe "rabbitmq::mgmt_console"


####################################
# RabbitMQ users
####################################

# look in the "users" data bag for all entries having a "rabbitmq" key and process them

search("users", "*:*").reject{ |u| u['rabbitmq'].nil? }.each do |user|
  Chef::Log.info "Found user #{user['id']} as rabbitmq user"

  Chef::Log.info "Opening data bag passwords/#{node.chef_environment}"

  # get all passwords for this environment
  all_password_data = Chef::EncryptedDataBagItem.load("passwords", node.chef_environment)

  # remove . from fqdn
  # my_fqdn_cleaned = node["fqdn"].gsub(/\./, "")

  my_fqdn_cleaned = "mqtypo3org"

  Chef::Log.info "Looking for password rabbitmq.#{my_fqdn_cleaned}.#{user['id']}"
  if all_password_data["rabbitmq"][my_fqdn_cleaned][user['id']].nil?
    raise "Cannot find password for rabbitmq user '#{user['id']}' in data bag 'passwords/#{node["chef_environment"]}'."
  end

  password = all_password_data["rabbitmq"][my_fqdn_cleaned][user['id']]

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