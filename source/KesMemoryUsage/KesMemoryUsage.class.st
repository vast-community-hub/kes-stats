Class {
	#name : 'KesMemoryUsage',
	#superclass : 'Application',
	#category : 'KesMemoryUsage'
}

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesMemoryUsage class >> abtIsViewApplication [

	^true
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesMemoryUsage class >> packagingRulesFor: aRuleCollector [

	super packagingRulesFor: aRuleCollector.

	aRuleCollector
		initializeToNilClassVariable: 'Current'
			inClassNamed: KesAnalysisIntervalTester name;
		initializeToNilClassVariable: 'Instances'
			inClassNamed: KesAnalysisIntervalTester name.
  
	aRuleCollector
		replaceMethod: #kesInspect
		with: #kesWarningNotAvailableInRuntimeImage
		inClassNamed: Object name.

	aRuleCollector
		replaceMethod: #writeResultsToWorkspace
			with: #kesWarningNotAvailableInRuntimeImage
			inClassNamed: KesMemoryConsumptionView name;
		replaceMethod: #abtScrubImage
			with: #kesWarningNotAvailableInRuntimeImage
			inClassNamed: KesMemoryConsumptionView name;
		initializeToNilClassVariable: 'FilterString'
			inClassNamed: KesMemoryConsumptionView name.

	aRuleCollector
		replaceMethod: #browseClass
			with: #kesWarningNotAvailableInRuntimeImage
			inClassNamed: KesClassMemoryConsumption name;
		replaceMethod: #browseClass
			with: #kesWarningNotAvailableInRuntimeImage
			inClassNamed: KesClassMemoryConsumptionDelta name
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesMemoryUsage class >> removing [

	KesAnalysisIntervalTester reset.
	KesInstanceCountFilter reset.
	KesMemoryConsumptionView reset
]
