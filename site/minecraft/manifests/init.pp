class minecraft {
  $url = 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar'
  $install_dir = '/opt/micecraft'
  file {$install_dir:
    ensure => directory,
  }
  file {'/opt/micecraft/minecraft_server.jar':
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  package {'java':
    ensure => present,
  }
  file {"${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service {'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'], File["${install_dir}/eula.txt"], File['/etc/systemd/system/minecraft.service']],
  }
}
