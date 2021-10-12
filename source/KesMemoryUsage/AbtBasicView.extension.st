Extension {
	#name : 'AbtBasicView'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
AbtBasicView >> kesReleaseWithImpunity [

	parentView := nil.

	super kesReleaseWithImpunity
]
