# = Class: yum::repo::lewa
#
# This class installs the lewa repo
#
class yum::repo::lewa {

  yum::managed_yumrepo { 'lewa':
    descr => 'Lewatek yum repo.',
    baseurl => 'http://server.lewatek.com/yum/',
    enabled => 1,
    gpgcheck => 0,
    priority => 1,
  }

}
