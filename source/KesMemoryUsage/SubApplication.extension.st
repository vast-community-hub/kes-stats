Extension {
	#name : 'SubApplication'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
SubApplication class >> kesStaticMemoryConsumption [

	^KesApplicationStaticMemoryConsumption baseObject: self parent: nil
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
SubApplication >> kesMemoryUsage [

	^(EsAppMemoryUse memoryUsedByApp: self) total
]
