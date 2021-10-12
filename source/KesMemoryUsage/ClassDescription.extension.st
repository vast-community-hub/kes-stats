Extension {
	#name : 'ClassDescription'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
ClassDescription >> kesMemoryUsage [

	^(EsClassMemoryUse memoryUsedByClass: self) total
]
