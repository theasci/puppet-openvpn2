# == Define: openvpn::server
#
# This define creates the openvpn server instance which can run in server or client mode.
#
# === Parameters
#
# [*country*]
#   String.  Country to be used for the SSL certificate, mandatory for server mode.
#   Default: undef
#
# [*province*]
#   String.  Province to be used for the SSL certificate, mandatory for server mode.
#   Default: undef
#
# [*city*]
#   String.  City to be used for the SSL certificate, mandatory for server mode.
#   Default: undef
#
# [*organization*]
#   String.  Organization to be used for the SSL certificate, mandatory for server mode.
#   Default: undef
#
# [*email*]
#   String.  Email address to be used for the SSL certificate, mandatory for server mode.
#   Default: undef
#
# [*remote*]
#   Array.   List of OpenVPN endpoints to connect to.
#   Default: undef
#
# [*common_name*]
#   String.  Common name to be used for the SSL certificate
#   Default: server
#
# [*compression*]
#   String.  Which compression algorithim to use
#   Default: comp-lzo
#   Options: comp-lzo or '' (disable compression)
#
# [*dev*]
#   String.  TUN/TAP virtual network device
#   Default: tun0
#   Options: tunX (routed connections), tapX (bridged connections). X
#   can be omitted for a dynamic device.
#
# [*user*]
#   String.  Group to drop privileges to after startup
#   Default: nobody
#
# [*group*]
#   String.  User to drop privileges to after startup
#   Default: depends on your $::osfamily
#
# [*ipp*]
#   Boolean.  Persist ifconfig information to a file to retain client IP
#     addresses between sessions
#   Default: false
#
# [*duplicate_cn*]
#   Boolean.  Allow multiple connections on one cn
#   Default: false
#
# [*local*]
#   String.  Interface for openvpn to bind to.
#   Default: $::ipaddress_eth0
#   Options: An IP address or '' to bind to all ip addresses
#
# [*logfile*]
#   String.  Logfile for this openvpn server
#   Default: false
#   Options: false (syslog) or log file name
#
# [*port*]
#   Integer.  The port the openvpn server service is running on
#   Default: 1194
#
# [*proto*]
#   String.  What IP protocol is being used.
#   Default: tcp
#   Options: tcp or udp
#
# [*status_log*]
#   String.  Logfile for periodic dumps of the vpn service status
#   Default: "/var/log/openvpn/${name}-status.log"
#
# [*status_version*]
#   Integer. Choose the status file format version number. Can be 1, 2 or 3 and defaults to 1
#   Default: None (=1)
#
# [*server*]
#   String.  Network to assign client addresses out of
#   Default: None.  Required in tun mode, not in tap mode
#
# [*server_ipv6*]
#   String.  IPv6 network to assign client addresses out of
#   Default: None.
#
# [*server_bridge*]
#   String. Server configuration to comply with existing DHCP server
#   Default: None.
#
# [*push*]
#   Array.  Options to push out to the client.  This can include routes, DNS
#     servers, DNS search domains, and many other options.
#   Default: []
#
# [*route*]
#   Array.  Add route to routing table after connection is established.
#     Multiple routes can be specified.
#   Default: []
#
# [*route_ipv6*]
#   Array.  Add IPv6 route to routing table after connection is established.
#     Multiple routes can be specified.
#   Default: []
#
# [*keepalive*]
#   String.  Add keepalive directive (ping and ping-restart) to server.
#     Should match the form "n m".
#   Default: None
#
# [*ssl_key_size*]
#   String. Length of SSL keys (in bits) generated by this module.
#   Default: 1024
#
# [*topology*]
#   String. Define the network topology type
#   Default: net30
#
# [*c2c*]
#   Boolean.  Enable client to client visibility
#   Default: false
#
# [*tcp_nodelay*]
#   Boolean, Enable/Disable.
#   Default: false
#
# [*ccd-exclusive*]
#   Boolean, Enable/Disable.
#   Default: false
#
# [*pam*]
#   Boolean, Enable/Disable.
#   Default: false
#
# [*management*]
#   Boolean.  Enable management interface
#   Default: false
#
# [*management_ip*]
#   String.  IP address where the management interface will listen
#   Default: localhost
#
# [*management_port*]
#   String.  Port where the management interface will listen
#   Default: 7505
#
# [*up*]
#   String,  Script which we want to run when openvpn server starts
#
# [*down*]
#   String,  Script which we want to run when openvpn server stops
#
# [*username_as_common_name*]
#   Boolean. If true then set username-as-common-name
#   Default: false
#
# [*client_cert_not_required*]
#   Boolean. If true then set client-cert-not-required
#   Default: false
#
# [*ldap_enabled*]
#   Boolean. If ldap is enabled, do stuff
#   Default: false
#
# [*ldap_server*]
#   String. URL of LDAP server. ie. ldap://URL:PORT
#   Default: None
#
# [*ldap_binddn*]
#   String. LDAP DN to bind as
#   Default: None
#
# [*ldap_bindpass*]
#   String. LDAP password for ldapbinddn
#   Default: None
#
# [*ldap_u_basedn*]
#   String. Place in the LDAP tree to look for users
#   Default: None
#
# [*ldap_u_filter*]
#   String. User SearchFilter for LDAP accounts
#   Default: None
#
# [*ldap_g_basedn*]
#   String. Place in the LDAP tree to look for groups
#   Default: None
#
# [*ldap_gmember*]
#   Boolean. If defined use group block in ldap.conf
#   Default: false
#
# [*ldap_g_filter*]
#   String. Group SearchFilter for LDAP accounts
#   Default: None
#
# [*ldap_memberatr*]
#   String. Attribute for MemberAttribute. Used with ldapfilter
#   Default: None
#
# [*ldap_tls_enable*]
#   Boolean. Enable TLS for the LDAP authentication
#   Default: false
#
# [*ldap_tls_ca_cert_file*]
#   String. LDAP TLS authentication: path to the CA certificate.
#   Default: None
#
# [*ldap_tls_ca_cert_dir*]
#   String. LDAP TLS authentication: path to the CA certificates.
#   Default: None
#
# [*ldap_tls_client_cert_file*]
#   String. LDAP TLS authentication: path to the tls client certificate
#   Default: None
#
# [*ldap_tls_client_key_file*]
#   String. LDAP TLS authentication: path to the tls client key
#   Default: None
#
# [*verb*]
#   Integer.  Level of logging verbosity
#   Default: 3
#
# [*cipher*]
#   String,  Cipher to use for packet encryption
#   Default: None
#
# [*tls_cipher*]
#   String, TLS Ciphers to use
#   Default: None
#
# [*persist_key*]
#   Boolean.  Try to retain access to resources that may be unavailable
#     because of privilege downgrades
#   Default: false
#
# [*persist_tun*]
#   Boolean.  Try to retain access to resources that may be unavailable
#     because of privilege downgrades
#   Default: false
#
# [*key_expire*]
#   String.  The number of days to certify the server certificate for
#   Default: 3650
#
# [*ca_expire*]
#   String.  The number of days to certify the CA certificate for
#   Default: 3650
#
# [*key_name*]
#   String.  Value for name_default variable in openssl.cnf and
#     KEY_NAME in vars
#   Default: None
#
# [*key_ou*]
#   String.  Value for organizationalUnitName_default variable in openssl.cnf
#     and KEY_OU in vars
#   Default: None
#
# [*key_cn*]
#   String.  Value for commonName_default variable in openssl.cnf
#     and KEY_CN in vars
#   Default: None
#
# [*tls_auth*]
#   Boolean. Activates tls-auth to Add an additional layer of HMAC
#     authentication on top of the TLS control channel to protect
#     against DoS attacks.
#   Default: false
#
# [*tls_server*]
#   Boolean. If proto not tcp it lets you choose if the parameter
#     tls-server is set or not.
#   Default: false
#
# [*tls_client*]
#   Boolean. Allows you to set this server up as a tls-client connection.
#   Default: false
#
# [*server_poll_timeout*]
#   Integer. Value for timeout before trying the next server.
#   Default: undef
#
# [*ping_timer_rem*]
#   Boolean. Do not start clocking timeouts until a remote peer connects.
#   Default: false
#
# [*sndbuf*]
#   Integer, Set the TCP/UDP socket send buffer size.
#   Default: undef
#
# [*rcvbuf*]
#   Integer, Set the TCP/UDP socket receive buffer size.
#   Default: undef
#
# [*shared_ca*]
#   String.  Name of a openssl::ca resource to use config with
#   Default: undef
#
# [*autostart*]
#   Boolean. Enable autostart for this server if openvpn::autostart_all is false.
#   Default: undef
#
# [*ns_cert_type*]
#   Boolean. Enable or disable use of ns-cert-type for the session. Generally used
#   with client configuration
#   Default: true
#
# [*nobind*]
#   Boolean. Whether or not to bind to a specific port number.
#   Default: false
#
# [*custom_options*]
#   Hash of additional options that you want to append to the configuration file.
#
# === Examples
#
#   openvpn::client {
#     'my_user':
#       server      => 'contractors',
#       remote_host => 'vpn.mycompany.com'
#    }
#
# * Removal:
#     Manual process right now, todo for the future
#
#
# === Authors
#
# * Raffael Schmid <mailto:raffael@yux.ch>
# * John Kinsella <mailto:jlkinsel@gmail.com>
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
# === License
#
# Copyright 2013 Raffael Schmid, <raffael@yux.ch>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
define openvpn::server(
  $country                   = undef,
  $province                  = undef,
  $city                      = undef,
  $organization              = undef,
  $email                     = undef,
  $remote                    = undef,
  $common_name               = 'server',
  $compression               = 'comp-lzo',
  $dev                       = 'tun0',
  $user                      = 'nobody',
  $group                     = false,
  $ipp                       = false,
  $duplicate_cn              = false,
  $local                     = $::ipaddress_eth0,
  $logfile                   = false,
  $port                      = '1194',
  $proto                     = 'tcp',
  $status_version            = '',
  $status_log                = "/var/log/openvpn/${name}-status.log",
  $server                    = '',
  $server_ipv6               = '',
  $server_bridge             = '',
  $push                      = [],
  $route                     = [],
  $route_ipv6                = [],
  $keepalive                 = '',
  $fragment                  = false,
  $ssl_key_size              = 1024,
  $topology                  = 'net30',
  $c2c                       = false,
  $tcp_nodelay               = false,
  $ccd_exclusive             = false,
  $pam                       = false,
  $management                = false,
  $management_ip             = 'localhost',
  $management_port           = 7505,
  $up                        = '',
  $down                      = '',
  $username_as_common_name   = false,
  $client_cert_not_required  = false,
  $ldap_enabled              = false,
  $ldap_server               = '',
  $ldap_binddn               = '',
  $ldap_bindpass             = '',
  $ldap_u_basedn             = '',
  $ldap_g_basedn             = '',
  $ldap_gmember              = false,
  $ldap_u_filter             = '',
  $ldap_g_filter             = '',
  $ldap_memberatr            = '',
  $ldap_tls_enable           = false,
  $ldap_tls_ca_cert_file     = '',
  $ldap_tls_ca_cert_dir      = '',
  $ldap_tls_client_cert_file = '',
  $ldap_tls_client_key_file  = '',
  $ca_expire                 = 3650,
  $key_expire                = 3650,
  $key_cn                    = '',
  $key_name                  = '',
  $key_ou                    = '',
  $verb                      = '',
  $cipher                    = '',
  $tls_cipher                = undef,
  $persist_key               = false,
  $persist_tun               = false,
  $tls_auth                  = false,
  $tls_server                = false,
  $tls_client                = false,
  $server_poll_timeout       = undef,
  $ping_timer_rem            = false,
  $sndbuf                    = undef,
  $rcvbuf                    = undef,
  $shared_ca                 = undef,
  $autostart                 = undef,
  $ns_cert_type              = true,
  $nobind                    = false,
  $custom_options            = {},
) {

  include openvpn
  Class['openvpn::install'] ->
  Openvpn::Server[$name]

  if $::openvpn::manage_service {
    if $::openvpn::params::systemd {
      $lnotify = Service["openvpn@${name}"]
    } else {
      $lnotify = Service['openvpn']
      Openvpn::Server[$name] -> Service['openvpn']
    }
  }
  else {
    $lnotify = undef
  }

  # Selection block to enable or disable tls-server flag
  # Check if we want to run as a client or not
  if !$tls_client {
    if $tls_server {
      $real_tls_server = $tls_server
    } else {
      $real_tls_server = $proto ? {
        /tcp/   => true,
        default => false
      }
    }
  }

  $pam_module_path = $::openvpn::params::pam_module_path

  $group_to_set = $group ? {
    false   => $openvpn::params::group,
    default => $group
  }

  if $shared_ca {
    $ca_name = $shared_ca
  } else {
    $ca_name = $name
  }

  File {
    group => $group_to_set,
  }

  file { "${etc_directory}/openvpn/${name}":
    ensure => directory,
    mode   => '0750',
    notify => $lnotify,
  }

  if !$remote {
    if !$shared_ca {
      # VPN Server Mode
      if $country == undef { fail('country has to be specified in server mode') }
      if $province == undef { fail('province has to be specified in server mode') }
      if $city == undef { fail('city has to be specified in server mode') }
      if $organization == undef { fail('organization has to be specified in server mode') }
      if $email == undef { fail('email has to be specified in server mode') }

      $ca_common_name = $common_name
      ::openvpn::ca { $name:
        country      => $country,
        province     => $province,
        city         => $city,
        organization => $organization,
        email        => $email,
        common_name  => $common_name,
        group        => $group,
        ssl_key_size => $ssl_key_size,
        ca_expire    => $ca_expire,
        key_expire   => $key_expire,
        key_cn       => $key_cn,
        key_name     => $key_name,
        key_ou       => $key_ou,
        tls_auth     => $tls_auth,
      }
    } else {
      if !defined(Openvpn::Ca[$shared_ca]) {
        fail("Openvpn::ca[${name}] is not defined for shared_ca")
      }
      $ca_common_name = getparam(Openvpn::Ca[$shared_ca], 'common_name')
    }

    file {
      [ "${etc_directory}/openvpn/${name}/auth",
      "${etc_directory}/openvpn/${name}/client-configs",
      "${etc_directory}/openvpn/${name}/download-configs" ]:
        ensure  => directory,
        mode    => '0750',
        recurse => true,
    }
  } else {
    # VPN Client Mode
    $ca_common_name = $name

    file { "${etc_directory}/openvpn/${name}/keys":
      ensure  => directory,
      mode    => '0750',
      recurse => true,
    }
  }

  if $::osfamily == 'Debian' and !$::openvpn::autostart_all and $autostart {
    concat::fragment { "openvpn.default.autostart.${name}":
      content => "AUTOSTART=\"\$AUTOSTART ${name}\"\n",
      target  => '/etc/default/openvpn',
      order   => '10',
    }
  }

  file { "${etc_directory}/openvpn/${name}.conf":
    owner   => root,
    group   => $root_group,
    mode    => '0440',
    content => template('openvpn/server.erb'),
    notify  => $lnotify,
  }

  if $ldap_enabled == true {
    file {
      "${etc_directory}/openvpn/${name}/auth/ldap.conf":
        ensure  => present,
        content => template('openvpn/ldap.erb'),
        require => Package['openvpn-auth-ldap'],
    }
  }

  if $::openvpn::params::systemd {
    if $::openvpn::manage_service {
      service { "openvpn@${name}":
        ensure   => running,
        enable   => true,
        provider => 'systemd',
        require  => [ File["${etc_directory}/openvpn/${name}.conf"], Openvpn::Ca[$ca_name] ]
      }
    }
  }

  if $::operatingsystem == 'FreeBSD' {
    file { "${etc_directory}/rc.d/openvpn-${name}":
      ensure => link,
      source => "${etc_directory}/rc.d/openvpn",
    }
  }

}
