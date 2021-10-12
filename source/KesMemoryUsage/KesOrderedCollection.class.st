Class {
	#name : 'KesOrderedCollection',
	#superclass : 'OrderedCollection',
	#category : 'KesMemoryUsage'
}

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesOrderedCollection class >> kesIncludeInInstanceCount [
	
	^false
]

{ #category : 'KES-Internal' }
KesOrderedCollection >> kesAsExcludedObject [

	^self
]
