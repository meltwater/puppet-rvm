class rvm::dependencies::centos {

  $version = $::operatingsystem ? {
    'Amazon' => '6.x',
    default  => $::operatingsystemrelease,
  }

  case $version {
    /^6\..*/: {
      realize( Package['libcurl-devel'] )
    }
    /^5\..*/: {
      realize( Package['curl-devel'] )
      realize( Package['autoconf'] )
    }
    default: {
      realize( Package['curl-devel'] )
    }
  }

  $deps = ['which','gcc','gcc-c++','make','gettext-devel','expat-devel','zlib-devel','openssl-devel','perl','cpio','gettext-devel','wget','bzip2','libxml2','libxml2-devel','libxslt','libxslt-devel','readline-devel','patch','git','libyaml-devel','libffi-devel','libtool','bison']

  realize( Package[$deps] )
}
