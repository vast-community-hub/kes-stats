Extension {
	#name : 'AbtAppBldrNonVisual'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
AbtAppBldrNonVisual >> kesAddToReleaseWithImpunityList: list [

	attributeConnections notNil
		ifTrue: [attributeConnections do: [:conn | conn kesAddToReleaseWithImpunityList: list]].

	super kesAddToReleaseWithImpunityList: list
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
AbtAppBldrNonVisual >> kesReleaseWithImpunity [

	primaryPart := nil.
	attributeConnections := nil.

	super kesReleaseWithImpunity
]
