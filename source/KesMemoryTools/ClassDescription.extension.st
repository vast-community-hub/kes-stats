Extension {
	#name : 'ClassDescription'
}

{ #category : '*KesMemoryTools',
 #vaCategories : ['KES-Extension','KES-Tools'] }
ClassDescription >> kesMemoryUse [

	^(EsClassMemoryUse kesStaticMemoryUsedByClass: self inApp: self controller)
]

{ #category : '*KesMemoryTools',
 #vaCategories : ['KES-Extension','KES-Tools'] }
ClassDescription >> kesStaticMemoryConsumption [

	^self kesStaticMemoryConsumptionClass baseObject: self name
]

{ #category : '*KesMemoryTools',
 #vaCategories : ['KES-Extension','KES-Tools'] }
ClassDescription >> kesStaticMemoryConsumptionClass [

	^KesClassStaticMemoryConsumption
]
