Extension {
	#name : 'Collection'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
Collection >> kesAddToReleaseWithImpunityList: list [

	(list includes: self)
		ifFalse: [
			super kesAddToReleaseWithImpunityList: list.
			self do: [:obj| obj kesAddToReleaseWithImpunityList: list]]

]
