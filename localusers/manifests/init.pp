class localusers { 
        user { 'admin':
                ensure          => present,
                shell           => '/bin/bash',
                home            => 'home/admin',
                gid             => 'wheel',
                managehome      => true,
                password        => '$6$xFJeBAQt$vc0fHq76.qH/a61HOQg6BSKvvyFJHo/ErNzKZI2E2ZbQ6EGKeYHBCTlC55miZtEiCkCZD6045pliVVvFUCc0C1'        }
	user { 'jeff':
			ensure  => present,
			shell	=> '/bin/bash',
			home 	=> '/home/jeff',
			groups	=> ['wheel', 'finance'],
			managehome => true
	}
}
