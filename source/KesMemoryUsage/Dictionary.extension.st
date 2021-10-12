Extension {
	#name : 'Dictionary'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
Dictionary >> kesAsExcludedObject [

	^self convertToClass: KesDictionary
]
