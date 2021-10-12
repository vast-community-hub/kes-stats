Class {
	#name : 'KesInspector',
	#superclass : 'EtInspector',
	#classVars : [
		'KesDisplayMemoryUsage'
	],
	#category : 'KesMemoryTools'
}

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesInspector class >> kesDisplayMemoryUsage [

	^KesDisplayMemoryUsage == true
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesInspector class >> kesDisplayMemoryUsage: boolean [

	KesDisplayMemoryUsage := boolean
]

{ #category : 'KES-Tools' }
KesInspector class >> updateOptionsMenu: optionsMenu [

	^optionsMenu
		add: #toggleDisplayMemoryUsage label: 'Display ~Memory Usage' enable: true toggle: [self kesDisplayMemoryUsage] owner: self;
		yourself
]

{ #category : 'KES-Tools' }
KesInspector class >> updateStatusLineText: statusLineText for: inspector [

	^(self kesDisplayMemoryUsage and: [inspector selectedValue notNil])
		ifTrue: [
			(inspector selectedValue isKindOf: Collection)
				ifTrue: [statusLineText, ', ', (inspector selectedValue inject: 0 into: [:sum :var| sum + var kesMemoryUsage]) kesLocalePrintString, ' bytes']
				ifFalse: [statusLineText, ', ', inspector selectedValue kesMemoryUsage kesLocalePrintString, ' bytes']]
		ifFalse: [statusLineText]
]

{ #category : 'KES-Tools' }
KesInspector >> inspectReferences [

	"Inspect the object references to the selected variable."

	self execShortOperation: [
		self selectedValue kesAllReferences kesInspect]
]

{ #category : 'KES-Tools' }
KesInspector >> inspectVariable [

	"Inspect the value of the selected variable."

	self execShortOperation: [
		self selectedValue kesInspect]
]

{ #category : 'KES-Tools' }
KesInspector >> optionsMenu [

	^self kesUpdateOptionsMenu: super optionsMenu
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesInspector >> statusLineText [

	^self kesUpdateStatusLineText: super statusLineText
]
