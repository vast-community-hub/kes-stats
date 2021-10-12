Extension {
	#name : 'Behavior'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
Behavior >> kesAllInstances [
	| undesireables |

	undesireables := self kesUndesireableClasses.

	^KesInstances instances: (self allInstances reject: [:ref| ref kesIsExcludedObject or: [undesireables includes: ref class]])
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
Behavior >> kesBasicAllInstances [
	| undesireables |

	undesireables := self kesUndesireableClasses.

	^KesInstances instances: (self basicAllInstances reject: [:ref| ref kesIsExcludedObject or: [undesireables includes: ref class]])
]
