Class {
	#name : 'KesString',
	#superclass : 'String',
	#type : 'bytes',
	#category : 'KesMemoryUsage'
}

{ #category : 'KES-Internal' }
KesString class >> fromString: aString [

	^(self new: aString size)
		replaceFrom: 1 to: aString size with: aString;
		yourself
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesString class >> kesIncludeInInstanceCount [

	^false
]

{ #category : 'KES-Internal' }
KesString >> kesAsExcludedObject [

	^self
]
