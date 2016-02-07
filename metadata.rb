name             "site-mqtypo3org"
maintainer       "TYPO3 Association"
maintainer_email "steffen.gebert@typo3.org"
license          "Apache 2.0"
description      "Installs/Configures mq.typo3.org"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version "0.0.33"

depends "t3-base",          "~> 0.2.0"

depends "t3-chef-vault",    "~> 1.0.0"
depends "ssl_certificates", "~> 1.1.0"
depends "zabbix-custom-checks",   "~> 0.2.0"

depends "rabbitmq",         "= 2.3.2"
depends "nginx",            "= 1.6.0"
