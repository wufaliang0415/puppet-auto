# = Class: yum::repo::goodbaby
#
# This class installs the goodbaby repo
#
class yum::repo::goodbaby {

  yum::managed_yumrepo { 'goodbaby':
    descr => 'Goodbaby official release packages',
    baseurl => 'http://puppet.beta.goodbaby.com/yum/',
    enabled => 1,
    gpgcheck => 0,
    priority => 1,
  }

}
