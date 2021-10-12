Extension {
	#name : 'EtInspector'
}

{ #category : '*KesMemoryTools',
 #vaCategories : ['KES-Extension','KES-Tools'],
  #vaVisibility : 'private' }
EtInspector >> kesToggleDisplayMemoryUsage [

	KesInspector kesDisplayMemoryUsage: KesInspector kesDisplayMemoryUsage not.
	self updateStatusLine
]

{ #category : '*KesMemoryTools',
 #vaCategories : ['KES-Extension','KES-Tools'],
  #vaVisibility : 'private' }
EtInspector >> kesUpdateOptionsMenu: menu [

	^menu
		add: #kesToggleDisplayMemoryUsage label: 'Display ~Memory Usage' enable: true toggle: [KesInspector kesDisplayMemoryUsage]
		yourself
]

{ #category : '*KesMemoryTools',
 #vaCategories : ['KES-Extension','KES-Tools'],
  #vaVisibility : 'private' }
EtInspector >> kesUpdateStatusLineText: text [

	^(KesInspector kesDisplayMemoryUsage and: [self selectedValue notNil])
		ifTrue: [text, ', ', self selectedValue kesMemoryUsage kesLocalePrintString, ' bytes']
		ifFalse: [text]
]
