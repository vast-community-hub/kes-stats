Class {
	#name : 'KesExcludedObject',
	#superclass : 'nil',
	#instVars : [
		'value'
	],
	#category : 'KesMemoryUsage'
}

{ #category : 'KES-Internal' }
KesExcludedObject class >> fromObject: anObject [

	^(self new)
		makeWeak;
		value: anObject;
		yourself
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesExcludedObject >> doesNotUnderstand: message [

	value isNil
		ifTrue: [^nil].

	^message sendTo: value
]

{ #category : 'KES-Internal' }
KesExcludedObject >> kesAsExcludedObject [

	^self
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesExcludedObject >> kesIncludeInInstanceCount [

	^false
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesExcludedObject >> PackagerClass [

	"Answer a Class which is the receiver's class"

	<primitive: VMprObjectClass>
	^self primitiveFailed
]

{ #category : 'KES-Internal' }
KesExcludedObject >> value: anObject [

	value := anObject
]
