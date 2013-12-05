# == node: drvideo-developer-setup.vagrantup.com
# vagrant environment for puppet development
# === Authors
# Johan Sydseter <johan.sydseter@startsiden.no>
node 'drvideo-developer-setup.vagrantup.com' {


  class { 'apache': } ->
  file { '/var/www/videoplaza-html5':
     ensure => 'link',
     target => '/home/vagrant/src/videoplaza-html5',
  } 


  apache::vhost { 'videoplaza-html5':
    docroot  => '/var/www/videoplaza-html5',
  }



  class { 'php': }

  class { 'nodejs': 
    version => 'stable',
  } -> 

  package { 'grunt-cli':
    provider        => 'npm',
    install_options => ['-g']
  }
}
