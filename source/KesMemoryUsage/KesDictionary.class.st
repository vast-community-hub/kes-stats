Class {
	#name : 'KesDictionary',
	#superclass : 'Dictionary',
	#category : 'KesMemoryUsage'
}

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesDictionary class >> kesIncludeInInstanceCount [
	
	^false
]

{ #category : 'KES-Internal' }
KesDictionary >> kesAsExcludedObject [

	^self
]
