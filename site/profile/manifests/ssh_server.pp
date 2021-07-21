class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key { 'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxekXnxZ3VLN1o6mdJZURIezf8SwEbrx1MxR8xhTayJese60TVZ7bwgvMofjKPplc39PVE0rnBbRe2WcUIvhteVGq0GICa+p7jEJzTVw7yDFKxHJCz7Uo1SLY7o1Zysi2zU7DN5eyUgwKPa8bXa2BIL4/RhiWBLmETGH2YEWDZO2Sx0HmqIaBT+Ec4Eo1J/0O9/SY/6S27ZiK2JQbVESjsQv02inXBhu81vKTc4nh4IRzQXVdJP2GBdhxscKxHiyQgV2A8eUyzMttPne2YWFqWFe3dmJOviYh15Tgo67QZqNwTMjr4FVfnVbOsxo/HICYrhz4TaQxchI3pL4GIn5Zj root@master.puppet.vm',
  }  
}
