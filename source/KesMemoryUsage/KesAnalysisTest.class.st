Class {
	#name : 'KesAnalysisTest',
	#superclass : 'Object',
	#instVars : [
		'intervalSeconds',
		'resultString',
		'nextTimeInterval',
		'intervalTester'
	],
	#category : 'KesMemoryUsage'
}

{ #category : 'KES-Internal' }
KesAnalysisTest class >> defaultIntervalTester [

	^KesAnalysisIntervalTester current
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesAnalysisTest class >> kesIncludeInInstanceCount [

	^false
]

{ #category : 'KES-Internal' }
KesAnalysisTest >> displayName [

	^self class name asString
]

{ #category : 'KES-Internal' }
KesAnalysisTest >> intervalSeconds [

	intervalSeconds isNil
		ifTrue: [^10].

	^intervalSeconds
]

{ #category : 'KES-Internal' }
KesAnalysisTest >> intervalSeconds: anInteger [

	intervalSeconds := anInteger.
	self signalEvent: #intervalSeconds with: anInteger
]

{ #category : 'KES-Internal' }
KesAnalysisTest >> intervalTester [

	intervalTester isNil
		ifTrue: [^self class defaultIntervalTester].

	^intervalTester
]

{ #category : 'KES-Internal' }
KesAnalysisTest >> intervalTester: aTester [

	intervalTester := aTester
]

{ #category : 'KES-Internal' }
KesAnalysisTest >> isRunning [

	^self intervalTester isRunning: self
]

{ #category : 'KES-Internal' }
KesAnalysisTest >> nextTimeInterval [

	nextTimeInterval isNil
		ifTrue: [^Time fromSeconds: 86400].

	^nextTimeInterval
]

{ #category : 'KES-Internal' }
KesAnalysisTest >> performTest [

	self restart
]

{ #category : 'KES-Internal' }
KesAnalysisTest >> restart [

	nextTimeInterval := Time fromSeconds: (Time now asSeconds + self intervalSeconds).
	self signalEvent: #nextTimeInterval
]

{ #category : 'KES-Internal' }
KesAnalysisTest >> resultString [

	(resultString isNil) ifTrue: [^'<none>'].

	^resultString
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesAnalysisTest >> resultString: aString [

	resultString := aString.
	self signalEvent: #resultString with: aString
]

{ #category : 'KES-Internal' }
KesAnalysisTest >> start [

	self performTest.
	self intervalTester startTesting: self
]

{ #category : 'KES-Internal' }
KesAnalysisTest >> stop [

	self intervalTester stopTesting: self.

	nextTimeInterval := Time fromSeconds: 86400.
	self signalEvent: #nextTimeInterval
]
