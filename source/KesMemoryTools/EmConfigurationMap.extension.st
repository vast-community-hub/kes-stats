Extension {
	#name : 'EmConfigurationMap'
}

{ #category : '*KesMemoryTools',
 #vaCategories : ['KES-Extension','KES-Tools'] }
EmConfigurationMap class >> kesAllLoadedMaps [

	^self kesLoadedMapsMatching: '*'
]

{ #category : '*KesMemoryTools',
 #vaCategories : ['KES-Extension','KES-Tools'] }
EmConfigurationMap class >> kesLoadedMapsMatching: matchName [

	| allMaps mapNames maps editions |

	mapNames :=
		matchName subStrings collect: [:mapName |
			(mapName includes: $*)
				ifTrue: [mapName]
				ifFalse: [mapName , '*']].

	maps := OrderedCollection new.
	allMaps :=
		(self configurationMapNames select: [:mapName | (mapNames detect: [:mn | mn match: mapName] ifNone: [nil]) notNil])
			asSortedCollection.

	allMaps isEmpty
		ifTrue: [
			System message: ('No maps match the name ''%1''' bindWith: matchName).
			^nil].

	AbtAppBldrSmalltalkEditorApp
		execLongOperation: [:dialogue |
			allMaps doWithIndex: [:mapName :i |
				dialogue cancelled
					ifTrue: [maps := nil]
					ifFalse: [
						dialogue
							fractionComplete: (i / allMaps size)
							messageString: ('Searching the loaded maps (%1)...' bindWith: mapName).
						editions := (self editionsFor: mapName)
							select: [:map | map areApplicationsLoaded].
						(editions size > 1)
							ifTrue: [
								maps add: (
									editions
										detect: [:edition | edition isEdition]
										ifNone: [editions first])]
							ifFalse: [maps addAll: editions]]]]
		message: ('Searching the loaded maps...' abrPadWithBlanks: 96)
		allowCancel: true
		showProgress: true
		parent: nil.

	^maps
]

{ #category : '*KesMemoryTools',
 #vaCategories : ['KES-Extension','KES-Tools'] }
EmConfigurationMap >> kesStaticMemoryConsumption [

	^KesConfigurationMapStaticMemoryConsumption baseObject: self parent: nil
]
