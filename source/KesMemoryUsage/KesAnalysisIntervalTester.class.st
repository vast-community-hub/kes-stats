Class {
	#name : 'KesAnalysisIntervalTester',
	#superclass : 'Object',
	#instVars : [
		'intervalProcess',
		'intervalWaitSem',
		'testList',
		'testProcess',
		'testWaitSem'
	],
	#classVars : [
		'Current',
		'Instances'
	],
	#category : 'KesMemoryUsage'
}

{ #category : 'KES-Internal' }
KesAnalysisIntervalTester class >> current [

	(Current isNil) ifTrue: [Current := self new].

	^Current
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesAnalysisIntervalTester class >> instances [

	(Instances isNil) ifTrue: [Instances := OrderedCollection new].

	^Instances

	
]

{ #category : 'KES-Internal' }
KesAnalysisIntervalTester class >> intervalBlock [

	^[:waitSem|
		[true] whileTrue: [
			(waitSem hasSignals) ifFalse: [waitSem signal].
			(Delay forMilliseconds: 500) wait].
	]
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesAnalysisIntervalTester class >> kesIncludeInInstanceCount [

	^false
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesAnalysisIntervalTester class >> new [

	| tester |

	tester := super new.
	tester reset.
	self instances add: tester.

	^tester
]

{ #category : 'KES-Internal' }
KesAnalysisIntervalTester class >> reset [

	Current := Instances := nil
]

{ #category : 'KES-Internal' }
KesAnalysisIntervalTester class >> stop [

	self instances do: [:each| each stop].
	Instances := OrderedCollection new.
	Current := nil.
]

{ #category : 'KES-Internal' }
KesAnalysisIntervalTester class >> testBlock [

	^[:waitSem :list|
		| ready |

		[true] whileTrue: [
			ready := list select: [:test| Time now > test nextTimeInterval].
			ready do: [:each| each performTest].
			waitSem wait].
	]
]

{ #category : 'KES-Internal' }
KesAnalysisIntervalTester >> reset [
	
	self stop.

	testProcess := self class testBlock newProcessWith: 
		(Array with: testWaitSem with: testList).
	testProcess priority: Processor userBackgroundPriority; resume.
	intervalProcess := self class intervalBlock newProcessWith:
		(Array with: testWaitSem).
	intervalProcess priority: Processor userBackgroundPriority; resume.

	
]

{ #category : 'KES-Internal' }
KesAnalysisIntervalTester >> startTesting: aTest [

	self testList add: aTest.
]

{ #category : 'KES-Internal' }
KesAnalysisIntervalTester >> stop [

	(intervalProcess notNil) ifTrue: [
		intervalProcess terminate.
		intervalProcess := nil].
	(testProcess notNil) ifTrue: [
		testProcess terminate.
		testProcess := nil].

	testList := OrderedCollection new.
	intervalWaitSem := Semaphore new.
	testWaitSem := Semaphore new.

]

{ #category : 'KES-Internal' }
KesAnalysisIntervalTester >> stopTesting: aTest [

	self testList remove: aTest ifAbsent: [].
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesAnalysisIntervalTester >> testList [

	^testList
]
