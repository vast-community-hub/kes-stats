Extension {
	#name : 'Object'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
Object class >> kesIncludeInInstanceCount [

	^KesInstanceCountFilter current kesIncludeInInstanceCount: self
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
Object class >> kesUndesireableClasses [

	^Set new
		add: Context;
		add: BlockContext;
		add: MethodContext;
		add: KesArray;
		add: KesDictionary;
		add: KesExcludedObject;
		add: KesInstances;
		add: KesOrderedCollection;
		add: KesString;
		add: KesTime;
		add: 'KesInspector' asClass;
		add: 'KesDebugInspector' asClass;
		add: 'KesDictionaryInspector' asClass;
		add: 'KesIndexedCollectionInspector' asClass;
		add: 'DbgVariableReference' asClass;
		add: 'DbgIndexedReference' asClass;
		add: 'DbgIndexedInstVarReference' asClass;
		add: 'DbgIndexedVariableReference' asClass;
		add: 'DbgNamedInstVarReference' asClass;
		add: 'DbgKeyedVariableReference' asClass;
		yourself
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
Object >> kesAddToReleaseWithImpunityList: list [

	list add: self.
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
Object >> kesAllReferences [
	| undesireables |

	undesireables := self class kesUndesireableClasses.

	^KesInstances instances: (self allReferences reject: [:ref| ref kesIsExcludedObject or: [undesireables includes: ref class]])
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
Object >> kesAsExcludedObject [

	^self abrIsImmutable
		ifTrue: [self]
		ifFalse: [KesExcludedObject fromObject: self]
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
Object >> kesBasicAllReferences [
	| undesireables |

	undesireables := self class kesUndesireableClasses.

	^KesInstances instances: (self basicAllReferences reject: [:ref| ref kesIsExcludedObject or: [undesireables includes: ref class]])
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
Object >> kesBecomeNil [

	self become: nil
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
Object >> kesCreateReleaseWithImpunityList [

	| list list2 |

	list := OrderedCollection new.
	self kesAddToReleaseWithImpunityList: list.
	list2 := OrderedCollection new: list size.
	list do: [:item | list2 detect: [:item2 | item2 == item] ifNone: [list2 add: item]].

	^list2 asArray makeWeak
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
Object >> kesIncludeInInstanceCount [

	^self class kesIncludeInInstanceCount
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
Object >> kesInspect [

	^(self abrIsImmutable
		ifTrue: [self]
		ifFalse: [self kesAsExcludedObject]) inspect
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
Object >> kesIsExcludedObject [

	^self kesIncludeInInstanceCount == false
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
Object >> kesLocalePrintString [

	^self printString
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
Object >> kesMemoryUsage [

	^self sizeOfRepresentation
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
Object >> kesProcessReleaseWithImpunity [

	self kesProcessReleaseWithImpunity: [true]

]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
Object >> kesProcessReleaseWithImpunity: block [

	self kesCreateReleaseWithImpunityList doWithIndex: [:obj :i| 
		obj kesReleaseWithImpunity.
		[Processor finalizeCycle] whileTrue: [].
		block value]
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
Object >> kesReleaseWithImpunity [

	self release
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
Object >> kesWarningNotAvailableInRuntimeImage [

	CwMessagePrompter
		message: 'This function is not available in a runtime image.'
		title: self class name


]
