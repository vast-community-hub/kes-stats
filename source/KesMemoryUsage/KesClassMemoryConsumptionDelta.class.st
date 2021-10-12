Class {
	#name : 'KesClassMemoryConsumptionDelta',
	#superclass : 'Magnitude',
	#instVars : [
		'memoryUse1',
		'memoryUse2'
	],
	#category : 'KesMemoryUsage'
}

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesClassMemoryConsumptionDelta class >> kesIncludeInInstanceCount [

	^false
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta class >> with: aClassMemoryUse1 [

	^(self new) 
		memoryUse1: aClassMemoryUse1 memoryUse2: nil;
		yourself
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta class >> with: aClassMemoryUse1 with: aClassMemoryUse2 [

	^(self new) 
		memoryUse1: aClassMemoryUse1 memoryUse2: aClassMemoryUse2;
		yourself
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> < aClassMemoryUse [

	^self deltaTotalSize < aClassMemoryUse deltaTotalSize
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> allInstances [

	(self memoryUse1 isNil) ifFalse: [^self memoryUse1 allInstances].
	(self memoryUse2 isNil) ifFalse: [^self memoryUse2 allInstances].


]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> asDisplayString [

	| stream |

	(self memoryUse1 notNil and: [self memoryUse2 notNil])
		ifTrue: [
			stream := WriteStream on: String new.
			stream
				nextPutAll: self className;
				tab.
			Locale default lcNumeric printNumber: self deltaTotalCount on: stream.

			^stream contents].

	^self memoryUse1 notNil
		ifTrue: [self memoryUse1 asDisplayString]
		ifFalse: [self memoryUse2 asDisplayString]
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> basicAllInstances [

	(self memoryUse1 isNil) ifFalse: [^self memoryUse1 basicAllInstances].
	(self memoryUse2 isNil) ifFalse: [^self memoryUse2 basicAllInstances].


]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> browseClass [

	(self memoryUse1 isNil) ifFalse: [^self memoryUse1 browseClass].
	(self memoryUse2 isNil) ifFalse: [^self memoryUse2 browseClass].


]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> className [

	(self memoryUse1 isNil) ifFalse: [^self memoryUse1 className].
	(self memoryUse2 isNil) ifFalse: [^self memoryUse2 className].

	^'<none>'
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> deltaTotalCount [

	(self memoryUse1 isNil | self memoryUse2 isNil) ifTrue: [^0].

	^self memoryUse2 totalCount - self memoryUse1 totalCount
	
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> deltaTotalSize [

	(self memoryUse1 isNil or: [self memoryUse2 isNil]) ifTrue: [^0].

	^self memoryUse2 totalSize - self memoryUse1 totalSize
	
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesClassMemoryConsumptionDelta >> hasRecordedInstances [

	^self memoryUse1 isNil
		ifTrue: [false]
		ifFalse: [self memoryUse1 hasRecordedInstances]
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> inspectAllInstances [

	(self memoryUse1 isNil) ifFalse: [^self memoryUse1 inspectAllInstances].
	(self memoryUse2 isNil) ifFalse: [^self memoryUse2 inspectAllInstances].


]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> inspectAllRecordedInstances [

	(self memoryUse1 notNil and: [self memoryUse1 hasRecordedInstances])
		ifTrue: [self memoryUse1 inspectAllRecordedInstances].
	(self memoryUse2 notNil and: [self memoryUse2 hasRecordedInstances])
		ifTrue: [self memoryUse2 inspectAllRecordedInstances].


]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesClassMemoryConsumptionDelta >> kesWarningNotAvailableInRuntimeImage [

	^super kesWarningNotAvailableInRuntimeImage
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> memoryUse1 [
	
	^memoryUse1
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesClassMemoryConsumptionDelta >> memoryUse1: aClassMemoryUse1 [

	memoryUse1 := aClassMemoryUse1	
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesClassMemoryConsumptionDelta >> memoryUse1: aClassMemoryUse1 memoryUse2: aClassMemoryUse2 [

	memoryUse1 := aClassMemoryUse1.
	memoryUse2 := aClassMemoryUse2.
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> memoryUse2 [
	
	^memoryUse2
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesClassMemoryConsumptionDelta >> memoryUse2: aClassMemoryUse2 [

	memoryUse2 := aClassMemoryUse2
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> recordAllInstances [

	(self memoryUse1 isNil) ifFalse: [self memoryUse1 recordAllInstances].


]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> totalCount [

	^((self memoryUse1 isNil) ifFalse: [self memoryUse1 totalCount] ifTrue: [0]) + 
		((self memoryUse2 isNil) ifFalse: [self memoryUse2 totalCount] ifTrue: [0]) 
]

{ #category : 'KES-Internal' }
KesClassMemoryConsumptionDelta >> totalSize [

	^((self memoryUse1 isNil) ifFalse: [self memoryUse1 totalSize] ifTrue: [0]) + 
		((self memoryUse2 isNil) ifFalse: [self memoryUse2 totalSize] ifTrue: [0]) 
]
