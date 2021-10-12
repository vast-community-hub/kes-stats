Class {
	#name : 'KesMemoryTools',
	#superclass : 'Application',
	#category : 'KesMemoryTools'
}

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesMemoryTools class >> abtIsViewApplication [

	^true
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesMemoryTools class >> addToSystemMenu [

	System systemMenu
		add: #openMemoryConsumptionMonitor label: 'Open ~Memory Consumption Monitor' enable: true for: self;
		add: #openStaticMemoryConsumptionView label: 'Open Static Memory Cons~umption View' enable: true for: self
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesMemoryTools class >> loaded [

	EtBaseTools browserMappings at: #inspector put: KesDebugInspector
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesMemoryTools class >> openMemoryConsumptionMonitor [

	KesMemoryConsumptionView new openWidget
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesMemoryTools class >> openStaticMemoryConsumptionView [

	KesStaticMemoryConsumptionView new openWidget
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesMemoryTools class >> removing [

	EtBaseTools browserMappings at: #inspector put: DbgInspector
]

{ #category : 'KES-Tools' }
KesMemoryTools class >> startUp [

	KesAnalysisIntervalTester stop
]
