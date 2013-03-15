include_recipe "rabbitmq"

include_recipe "rabbitmq::plugin_management"
include_recipe "rabbitmq::user_management"
include_recipe "rabbitmq::mgmt_console"


####################################
# RabbitMQ users
####################################

search("users", "*:*").reject{ |u| u['rabbitmq'].nil? || u['password'].nil? }.each do |user|
  Chef::Log.info "Found user #{user['id']} as rabbitmq user"

  rabbitmq_user user['id'] do
    password user['password']
    action :add
    # notifies :restart, "service[#{node['rabbitmq']['service_name']}]"
  end
  rabbitmq_user user['id'] do
    tag user['rabbitmq']['tag']
    action :set_tags
    # notifies :restart, "service[#{node['rabbitmq']['service_name']}]"
  end
  user['rabbitmq']['rights'].each  do |r|
    rabbitmq_user user['id'] do
      vhost r['vhost']
      permissions "#{r['conf']} #{r['write']} #{r['read']}"
      action :set_permissions
      # notifies :restart, "service[#{node['rabbitmq']['service_name']}]"
    end
  end

end