node default {
}
node 'master.puppet.vm' {
  include role::master_server
  file { '/root/README':
    ensure => file,
    content => $fqdn,
  }
}  

node /^web/ {
  include role::app_server
}

node /^db/ {
  include role::db_server
}
