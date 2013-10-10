# == node: drvideo-developer-setup.vagrantup.com
# vagrant environment for puppet development
# === Authors
# Johan Sydseter <johan.sydseter@startsiden.no>
node 'drvideo-developer-setup.vagrantup.com' {


  class { 'apache': }

  apache::vhost { 'videoplaza-html5':
    docroot  => '/var/www/videoplaza-html5',
  }

  class { 'php': }

}
