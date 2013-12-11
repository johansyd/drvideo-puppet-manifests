# == node: drvideo-developer-setup.vagrantup.com
# vagrant environment for puppet development
# === Authors
# Johan Sydseter <johan.sydseter@startsiden.no>
node 'drvideo-developer-setup.vagrantup.com' {


  class { 'apache': } ->
  file { '/var/www/videoplaza-html5':
     ensure => 'link',
     target => '/home/vagrant/videoplaza-html5',
  } 


  apache::vhost { 'videoplaza-html5':
    docroot  => '/var/www/videoplaza-html5',
  }

  class { 'php': }

  exec {'apt-get update':
   path => '/usr/bin:/usr/sbin:/bin',
  } ->

  package { 'alien':
    ensure  => 'installed',
    require => Package['dpkg-dev', 'debhelper']
  } ->

  # class { 'nodejs': }

  package { 'dpkg-dev':
    ensure => 'installed'
  }

  package { 'debhelper':
    ensure => 'installed'
  }
  

}
