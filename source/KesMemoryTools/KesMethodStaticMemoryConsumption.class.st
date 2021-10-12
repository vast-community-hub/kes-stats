Class {
	#name : 'KesMethodStaticMemoryConsumption',
	#superclass : 'KesStaticMemoryConsumption',
	#instVars : [
		'method',
		'isInstanceMethod'
	],
	#category : 'KesMemoryTools'
}

{ #category : 'KES-Tools' }
KesMethodStaticMemoryConsumption class >> memoryType [

	^'Method'
]

{ #category : 'KES-Tools' }
KesMethodStaticMemoryConsumption class >> sortBlock [

	^[:a :b| 
		(a isInstanceMethod = b isInstanceMethod)
			ifTrue: [a baseObject selector < b baseObject selector]
			ifFalse: [a isInstanceMethod]]
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesMethodStaticMemoryConsumption >> baseObject [
	| cls |

	^(cls := self parent baseObject asClass) notNil
		ifTrue: [
			self isInstanceMethod
				ifTrue: [cls compiledMethodAt: super baseObject asSymbol ifAbsent: [nil]]
				ifFalse: [cls class compiledMethodAt: super baseObject asSymbol ifAbsent: [nil]]]
		ifFalse: [nil]
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesMethodStaticMemoryConsumption >> baseObject: newBaseObject [
	isInstanceMethod := newBaseObject methodClass isMetaclass not.

	^super baseObject: newBaseObject selector
]

{ #category : 'KES-Tools' }
KesMethodStaticMemoryConsumption >> descendants [

	^OrderedCollection with: self
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesMethodStaticMemoryConsumption >> initialize [

	super initialize.
	isInstanceMethod := true
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesMethodStaticMemoryConsumption >> isInstanceMethod [

	^isInstanceMethod
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesMethodStaticMemoryConsumption >> isInstanceMethod: boolean [

	isInstanceMethod := boolean
]

{ #category : 'KES-Tools' }
KesMethodStaticMemoryConsumption >> memoryType [

	^(self baseObject notNil and: [self isIncluded])
		ifTrue: [
			self baseObject methodClass isMetaclass
				ifTrue: ['c-Method']
				ifFalse: ['i-Method']]
		ifFalse: [super memoryType]
]

{ #category : 'KES-Tools' }
KesMethodStaticMemoryConsumption >> openBaseObject [

	self baseObject notNil
		ifTrue: [self parent baseObject browse]
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesMethodStaticMemoryConsumption >> refresh [

	| methodsTotal mms |

	super refresh.
	self
		name: super baseObject asString;
		children: #().

	self baseObject notNil
		ifTrue: [
			mms := EsMethodMemoryUse memoryUsedByMethod: self baseObject.
			self total: mms total]
]
