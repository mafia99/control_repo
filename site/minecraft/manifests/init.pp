class minecraft {
  file {'/opt/micecraft':
    ensure => directory,
  }
  file {'/opt/micecraft/minecraft_server.jar':
    ensure => file,
    source => 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',
  }
  package {'jave':
    ensure => present,
  }
  file {'/opt/micecraft/eula.txt':
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
}
