Class {
	#name : 'KesConfigurationMapStaticMemoryConsumption',
	#superclass : 'KesStaticMemoryConsumption',
	#category : 'KesMemoryTools'
}

{ #category : 'KES-Tools' }
KesConfigurationMapStaticMemoryConsumption class >> memoryType [

	^'Map'
]

{ #category : 'KES-Tools' }
KesConfigurationMapStaticMemoryConsumption class >> sortBlock [

	^[:a :b| a baseObject name < b baseObject name]
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesConfigurationMapStaticMemoryConsumption >> baseObject [

	^(EmConfigurationMap editionsFor: super baseObject)
		detect: [:map | map areApplicationsLoaded]
		ifNone: [nil]
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesConfigurationMapStaticMemoryConsumption >> baseObject: newBaseObject [

	^super baseObject: newBaseObject name
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesConfigurationMapStaticMemoryConsumption >> childRefreshed [

	| myTotal |

	myTotal := 0.
	self baseObject notNil
		ifTrue: [self children do: [:app | myTotal := myTotal + app includedTotal]].
	self total: myTotal
]

{ #category : 'KES-Tools' }
KesConfigurationMapStaticMemoryConsumption >> openBaseObject [

	EtConfigurationManagement openConfigMapsBrowser
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesConfigurationMapStaticMemoryConsumption >> refresh [

	| apps applicationTotal |

	super refresh.

	self name: super baseObject asString.

	self baseObject notNil
		ifTrue: [
			apps :=
				self baseObject applicationNames collect: [:appName |
					KesApplicationStaticMemoryConsumption baseObject: appName parent: self].
			self children: apps.

			applicationTotal := 0.
			apps do: [:app | applicationTotal := applicationTotal + app includedTotal].
			self total: applicationTotal]
]
