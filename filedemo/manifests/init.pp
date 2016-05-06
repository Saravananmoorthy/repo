class filedemo {
	file { '/root/motd':
		ensure => present,
		source => 'puppet:///modules/filedemo/motd',
		owner => root,
		group => root,
		mode => '0644',
	     }

	file { '/etc/motd/':
		ensure => link,
		target => '/root/motd',
	     }
}
