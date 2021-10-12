Extension {
	#name : 'AbtAppBldrView'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
AbtAppBldrView >> kesReleaseWithImpunity [

	parentView := nil.

	super kesReleaseWithImpunity
]
