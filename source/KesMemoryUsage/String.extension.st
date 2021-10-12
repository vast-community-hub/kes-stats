Extension {
	#name : 'String'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
String >> kesAsExcludedObject [

	^KesString fromString: self
]
