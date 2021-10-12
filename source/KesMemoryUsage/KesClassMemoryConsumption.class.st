Class {
	#name : 'KesClassMemoryConsumption',
	#superclass : 'Magnitude',
	#instVars : [
		'className',
		'totalSize',
		'totalCount',
		'instances'
	],
	#category : 'KesMemoryUsage'
}

{ #category : 'KES-Internal' }
KesClassMemoryConsumption class >> className: className [

	^self new
		className: className;
		totalCount: 0;
		totalSize: 0;
		yourself
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumption class >> fromArrayCountInstances: anArray [

	^(self new)
		className: (anArray at: 1) name;
		totalCount: (anArray at: 2);
		totalSize: (anArray at: 3);
		yourself
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesClassMemoryConsumption class >> kesIncludeInInstanceCount [

	^false
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumption >> < aMeasure [

	^self totalSize < aMeasure totalSize
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumption >> allInstances [
	| result |

	System showBusyCursorWhile: [result := KesInstances allInstances: self className asClass].

	^result
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumption >> asDisplayString [

	| stream |

	stream := WriteStream on: String new.
	stream
		nextPutAll: self className;
		tab.
	Locale default lcNumeric printNumber: self totalCount on: stream.

	^stream contents
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumption >> basicAllInstances [
	| result |

	System showBusyCursorWhile: [result := KesInstances basicAllInstances: self className asClass].

	^result
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumption >> browseClass [

	self className asClass browse
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumption >> className [

	^className
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesClassMemoryConsumption >> className: aClassName [

	className := aClassName kesAsExcludedObject
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumption >> hasRecordedInstances [

	^instances notNil
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumption >> inspectAllInstances [

	System showBusyCursorWhile: [(KesInstances allInstances: self className asClass) kesInspect]
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumption >> inspectAllRecordedInstances [

	^self instances kesInspect
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumption >> instances [

	^instances isNil
		ifTrue: [#()]
		ifFalse: [instances]
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesClassMemoryConsumption >> kesWarningNotAvailableInRuntimeImage [

	^super kesWarningNotAvailableInRuntimeImage
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesClassMemoryConsumption >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: '(', self className, 
			', totalSize = ', self totalSize kesLocalePrintString,
			', totalCount = ', self totalCount kesLocalePrintString, ')'
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumption >> recordAllInstances [

	System showBusyCursorWhile: [instances := KesInstances allInstances: self className asClass]
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumption >> totalCount [

	^totalCount
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesClassMemoryConsumption >> totalCount: anInteger [

	totalCount := anInteger
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumption >> totalSize [

	^totalSize
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesClassMemoryConsumption >> totalSize: anInteger [

	totalSize := anInteger
]
