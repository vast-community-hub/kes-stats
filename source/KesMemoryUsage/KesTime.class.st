Class {
	#name : 'KesTime',
	#superclass : 'Time',
	#category : 'KesMemoryUsage'
}

{ #category : 'KES-Internal' }
KesTime class >> fromTime: aTime [

	^self fromSeconds: aTime asSeconds
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesTime class >> kesIncludeInInstanceCount [

	^false
]

{ #category : 'KES-Internal' }
KesTime >> kesAsExcludedObject [

	^self
]
