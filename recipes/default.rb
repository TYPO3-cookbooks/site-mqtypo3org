include_recipe "rabbitmq"

node.set['rabbitmq']['erlang_cookie'] = "1q2o890ajfakjhr2kjhakjhasd"

rabbitmq_plugin "rabbitmq_management" do
  notifies :restart, "service[rabbitmq-server]"
end

vhosts = [
  'infrastructure',
  'infrastructure_dev'
]

vhosts.each do |vhost|
  rabbitmq_vhost vhost
end

{
  'bbringenberg' => 'bbringenberg',
  'sgebert' => 'sgebert',
  'mstucki' => 'mstucki',
  'dev.forge.typo3.org' => 'dev.forge.typo3.org'
}.each do |user, pass|

  rabbitmq_user user do
    password pass
    action :add
  end

  rabbitmq_user user do
    tag 'administrator'
    action :set_tags
  end

  vhosts.each do |vhost_name|
    rabbitmq_user user do
      vhost vhost_name
      permissions ".* .* .*"
      action :set_permissions
    end
  end

end

rabbitmq_user 'guest' do
  action :delete
end