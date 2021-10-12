Class {
	#name : 'KesApplicationStaticMemoryConsumption',
	#superclass : 'KesStaticMemoryConsumption',
	#category : 'KesMemoryTools'
}

{ #category : 'KES-Tools' }
KesApplicationStaticMemoryConsumption class >> memoryType [

	^'Application'
]

{ #category : 'KES-Tools' }
KesApplicationStaticMemoryConsumption class >> methods: methods [

	^self new
		methods: methods;
		yourself
]

{ #category : 'KES-Tools' }
KesApplicationStaticMemoryConsumption class >> sortBlock [

	^[:a :b| a baseObject name < b baseObject name]
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesApplicationStaticMemoryConsumption >> baseObject [

	^super baseObject asClass
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesApplicationStaticMemoryConsumption >> baseObject: newBaseObject [

	^newBaseObject isString
		ifTrue: [super baseObject: newBaseObject asSymbol]
		ifFalse: [super baseObject: newBaseObject name]
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesApplicationStaticMemoryConsumption >> childRefreshed [

	| myTotal |

	myTotal := 0.
	self baseObject notNil
		ifTrue: [self children do: [:cls | myTotal := myTotal + cls includedTotal]].
	self total: myTotal


]

{ #category : 'KES-Tools' }
KesApplicationStaticMemoryConsumption >> methods: newMethods [

	| classes myTotal |

	self
		primBaseObject: newMethods first application name;
		primName: self baseObject name asString.

	classes := Dictionary new.
	myTotal := 0.

	newMethods do: [:method |
		| cls |
		cls := method methodClass.
		cls isMetaclass
			ifTrue: [cls := cls primaryInstance].
		(classes at: cls ifAbsent: [classes at: cls put: OrderedCollection new]) add: method.
		myTotal := myTotal + method kesMemoryUse total].

	self
		children: (
			(classes keys asSortedCollection: Class sortBlock) collect: [:cls |
				(cls kesStaticMemoryConsumptionClass methods: (classes at: cls))
					parent: self;
					yourself]);
		total: myTotal
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesApplicationStaticMemoryConsumption >> refresh [

	| myTotal |

	super refresh.
	self name: super baseObject asString.

	self baseObject notNil
		ifTrue: [
			self children:
				(self baseObject classes collect: [:cls |
					(cls kesStaticMemoryConsumptionClass
						baseObject: cls parent: self)
							application: self baseObject;
							yourself]) ,
					(self baseObject subApplications collect: [:app | self class baseObject: app name parent: self]).

			myTotal := 0.
			self children do: [:f | myTotal := myTotal + f includedTotal].
			self total: myTotal]
]
