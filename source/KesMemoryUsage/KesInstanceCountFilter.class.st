Class {
	#name : 'KesInstanceCountFilter',
	#superclass : 'Object',
	#instVars : [
		'matchPattern'
	],
	#classVars : [
		'Current'
	],
	#category : 'KesMemoryUsage'
}

{ #category : 'KES-Internal' }
KesInstanceCountFilter class >> current [

	Current isNil
		ifTrue: [Current := self new].

	^Current
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesInstanceCountFilter class >> kesIncludeInInstanceCount [

	^false
]

{ #category : 'KES-Internal' }
KesInstanceCountFilter class >> reset [

	Current := nil
]

{ #category : 'KES-Internal' }
KesInstanceCountFilter >> kesIncludeInInstanceCount: aClass [

	^matchPattern isNil
		ifTrue: [true]
		ifFalse: [
			(matchPattern detect: [:pattern| pattern match: aClass name asString] ifNone: [nil]) notNil]

]

{ #category : 'KES-Internal' }
KesInstanceCountFilter >> matchPattern [

	^(matchPattern isNil) 
		ifTrue: [#('*')]
		ifFalse: [matchPattern]
]

{ #category : 'KES-Internal' }
KesInstanceCountFilter >> matchPattern: aString [

	(aString isNil or: [aString trimBlanks isEmpty or: [aString = '*']]) 
		ifTrue: [matchPattern := nil]
		ifFalse: [
			matchPattern := aString subStrings
				collect: [:str| (str includes: $*) ifTrue: [str] ifFalse: [str, '*']]]
]
