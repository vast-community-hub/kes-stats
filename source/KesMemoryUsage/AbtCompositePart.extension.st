Extension {
	#name : 'AbtCompositePart'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
AbtCompositePart >> kesAddToReleaseWithImpunityList: list [

	components notNil
		ifTrue: [components do: [:obj | obj kesAddToReleaseWithImpunityList: list]].

	^super kesAddToReleaseWithImpunityList: list
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
AbtCompositePart >> kesReleaseWithImpunity [

	components := nil.

	super kesReleaseWithImpunity
]
