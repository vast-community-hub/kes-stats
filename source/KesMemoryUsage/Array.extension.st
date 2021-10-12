Extension {
	#name : 'Array'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
Array >> kesAsExcludedObject [

	^KesArray fromArray: self
]
