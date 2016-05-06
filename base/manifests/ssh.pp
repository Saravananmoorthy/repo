class base::ssh {
	package { 'openssh-package':
		name  => 'openssh-server',
		ensure => present,
		#before => File ['/etc/ssh/sshd_config'], #Make sure to install package before managing the /etc/ssh/sshd_config file.
		}
	
	file {	'/etc/ssh/sshd_config':
		ensure => file,
		owner => 'root',
		group => 'root',
		require => Package ['openssh-package'], #looks for package resource type to ensure the package is installed.
		source => 'puppet:///modules/base/sshd_config',
		notify => Service ['sshd'], #Notify the resource type 'S'ervice to automatically restart sshd.
		}
	service { 'sshd':
		ensure => running,
		enable => true,
		#subscribe => File ['/etc/ssh/sshd_config'], #This will help to restart the sshd service whenever /etc/ssh/sshd_config 'F'ile service changes.
		}
}
