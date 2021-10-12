Class {
	#name : 'KesClassStaticMemoryConsumption',
	#superclass : 'KesStaticMemoryConsumption',
	#instVars : [
		'application'
	],
	#classVars : [
		'IncludeMethods'
	],
	#category : 'KesMemoryTools'
}

{ #category : 'KES-Tools' }
KesClassStaticMemoryConsumption class >> includeMethods [

	^IncludeMethods == true
]

{ #category : 'KES-Tools' }
KesClassStaticMemoryConsumption class >> includeMethods: boolean [

	IncludeMethods := boolean
]

{ #category : 'KES-Tools' }
KesClassStaticMemoryConsumption class >> memoryType [

	^'Class'
]

{ #category : 'KES-Tools' }
KesClassStaticMemoryConsumption class >> methods: methods [

	^self new
		methods: methods;
		yourself
]

{ #category : 'KES-Tools' }
KesClassStaticMemoryConsumption class >> sortBlock [

	^[:a :b| a baseObject name < b baseObject name]
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesClassStaticMemoryConsumption >> application [

	^application isNil
		ifTrue: [
			self baseObject notNil
				ifTrue: [self baseObject controller]
				ifFalse: [nil]]
		ifFalse: [application asClass]
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesClassStaticMemoryConsumption >> application: newApplication [

	application := newApplication name
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesClassStaticMemoryConsumption >> baseObject [

	^super baseObject asClass
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesClassStaticMemoryConsumption >> baseObject: newBaseObject [

	^super baseObject: newBaseObject name
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesClassStaticMemoryConsumption >> childRefreshed [

	| myTotal |

	myTotal := 0.
	self baseObject notNil
		ifTrue: [self children do: [:mtd | myTotal := myTotal + mtd includedTotal]].
	self total: myTotal
]

{ #category : 'KES-Tools' }
KesClassStaticMemoryConsumption >> descendants [

	^self children isEmpty
		ifTrue: [OrderedCollection with: self]
		ifFalse: [self children]
]

{ #category : 'KES-Tools' }
KesClassStaticMemoryConsumption >> methods: methods [

	| cls myTotal |

	cls := methods first methodClass.
	cls isMetaclass
		ifTrue: [cls := cls primaryInstance].

	self
		primBaseObject: cls name;
		primName: self baseObject name asString.
	self application: methods first application.

	myTotal := 0.
	methods do: [:method | myTotal := myTotal + method kesMemoryUse total].
	self total: myTotal
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesClassStaticMemoryConsumption >> refresh [

	^self class includeMethods
		ifTrue: [self refreshWithMethods]
		ifFalse: [self refreshWithoutMethods]
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesClassStaticMemoryConsumption >> refreshMethods: boolean [

	^boolean
		ifTrue: [self refreshWithMethods]
		ifFalse: [self refreshWithoutMethods]
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesClassStaticMemoryConsumption >> refreshWithMethods [

	| myTotal |

	super refresh.
	self name: super baseObject asString.

	self baseObject notNil
		ifTrue: [
			self children:
				((self baseObject methodsIn: self parent baseObject) collect: [:mtd |
					mtd kesStaticMemoryConsumptionClass baseObject: mtd parent: self]) ,
				((self baseObject class methodsIn: self parent baseObject) collect: [:mtd |
					mtd kesStaticMemoryConsumptionClass baseObject: mtd parent: self]).

			self children:
				(self children asSortedCollection: KesMethodStaticMemoryConsumption sortBlock).

			myTotal := 0.
			self children do: [:f | myTotal := myTotal + f includedTotal].
			self total: myTotal]
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesClassStaticMemoryConsumption >> refreshWithoutMethods [

	| methodsTotal cms |

	super refresh.
	self
		name: super baseObject asString;
		children: #().

	self baseObject notNil
		ifTrue: [
			cms := EsClassMemoryUse memoryUsedByClass: self baseObject inApp: self application.
			(self baseObject controller == self application)
				ifTrue: [self total: cms total	"include the memory for the class itself"]
				ifFalse: [
					methodsTotal := 0.
					cms methods do: [:mmu | methodsTotal := methodsTotal + mmu total].
					self total: methodsTotal]]
]

{ #category : 'KES-Tools' }
KesClassStaticMemoryConsumption >> searchForChildrenOfSubclasses: subclasses [

	| cls |

	^((cls := self baseObject) notNil and: [
		(subclasses detect: [:subclass | cls inheritsFrom: subclass] ifNone: [nil]) notNil])
			ifTrue: [OrderedCollection with: self]
			ifFalse: [OrderedCollection new: 0]
]
