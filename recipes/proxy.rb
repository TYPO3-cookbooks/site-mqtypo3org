include_recipe "nginx"

if node['site-mqtypo3org']['proxy']['ssl']

  ssl_certfile_path = "/etc/ssl/certs/ssl-cert-snakeoil.pem"
  ssl_keyfile_path  = "/etc/ssl/certs/ssl-cert-snakeoil.key"

  # don't use snakeoil CA, if specified otherwise
  if node['site-mqtypo3org']['proxy']['ssl_certificate']
    ssl_certificate node['site-mqtypo3org']['proxy']['ssl_certificate']
    ssl_certfile_path = node['ssl_certificates']['path'] + "/" + node['site-mqtypo3org']['proxy']['ssl_certificate'] + ".crt"
    ssl_keyfile_path  = node['ssl_certificates']['path'] + "/" + node['site-mqtypo3org']['proxy']['ssl_certificate'] + ".key"
  end
end


template "#{node[:nginx][:dir]}/sites-available/#{node['site-mqtypo3org']['proxy']['hostname']}" do
  source "nginx-site.erb"
  mode "0644"
  notifies :restart, "service[nginx]"
  variables(
    :server_name  => node['site-mqtypo3org']['proxy']['hostname'],
    :ssl_certfile => ssl_certfile_path,
    :ssl_keyfile  => ssl_keyfile_path
  )
  notifies :reload, "service[nginx]"
end

nginx_site node['site-mqtypo3org']['proxy']['hostname'] do
  enable true
end
