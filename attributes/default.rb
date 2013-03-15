# make sure that there's no guest account!
default[:rabbitmq][:enabled_users] = []
default[:rabbitmq][:disabled_users] = ['guest']

default[:rabbitmq][:enabled_users] = [
  { :name => "sgebert", :password => "sgebert", :tag => "administrator", :rights =>
    [{:vhost => nil, :conf => ".*", :write => ".*", :read => ".*"}]},
  { :name => "bbringenberg", :password => "bbringenberg", :tag => "administrator", :rights =>
    [{:vhost => nil , :conf => ".*", :write => ".*", :read => ".*"}]}
]

default[:rabbitmq][:virtualhosts] = ['infrastructure', 'infrastructure_dev']

default[:rabbitmq][:ssl] = true