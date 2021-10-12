Extension {
	#name : 'OrderedCollection'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
OrderedCollection >> kesAsExcludedObject [

	^self convertToClass: KesOrderedCollection
]
