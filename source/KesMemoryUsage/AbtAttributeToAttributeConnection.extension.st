Extension {
	#name : 'AbtAttributeToAttributeConnection'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
AbtAttributeToAttributeConnection >> kesReleaseWithImpunity [

	source := target := nil.

	super kesReleaseWithImpunity

	
]
