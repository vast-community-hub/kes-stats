Class {
	#name : 'KesArray',
	#superclass : 'Array',
	#type : 'variable',
	#category : 'KesMemoryUsage'
}

{ #category : 'KES-Internal' }
KesArray class >> fromArray: anArray [

	^(self new: anArray size)
		replaceFrom: 1 to: anArray size with: anArray;
		yourself
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesArray class >> kesIncludeInInstanceCount [

	^false
]

{ #category : 'KES-Internal' }
KesArray >> kesAsExcludedObject [

	^self
]
