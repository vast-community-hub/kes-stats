| writer path |
path := (CfsPath named: '<insert path to root kes-stats local repo here>').
writer := TonelWriter new.
writer
	addLatestConfigurationMapNamed: 'KES/Stats';
	addApplicationsFromConfigurationMaps.
writer writeProjectInto: path.
