Extension {
	#name : 'CompiledMethod'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
CompiledMethod >> kesMemoryUsage [

	^(EsMethodMemoryUse memoryUsedByMethod: self) total
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
CompiledMethod >> kesMemoryUse [

	^(EsMethodMemoryUse memoryUsedByMethod: self)
]
