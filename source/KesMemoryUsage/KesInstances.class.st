Class {
	#name : 'KesInstances',
	#superclass : 'KesArray',
	#type : 'variable',
	#category : 'KesMemoryUsage'
}

{ #category : 'KES-Internal' }
KesInstances class >> allInstances: aClass [

	^self instances: aClass kesAllInstances
]

{ #category : 'KES-Internal' }
KesInstances class >> basicAllInstances: aClass [

	^self instances: aClass kesBasicAllInstances
]

{ #category : 'KES-Internal' }
KesInstances class >> instances: anArray [

	^(self new: anArray size)
		replaceFrom: 1 to: anArray size	with: anArray startingAt: 1;
		makeWeak;
		yourself
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesInstances class >> kesIncludeInInstanceCount [

	^false
]

{ #category : 'KES-Internal' }
KesInstances >> do: aBlock [
	"Ignore references that have been finalized."

	1
		to: self size
		do: [:index | (self at: index) notNil ifTrue: [aBlock value: (self at: index)]].
]
