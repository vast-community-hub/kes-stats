Class {
	#name : 'KesIndexedCollectionInspector',
	#superclass : 'EtIndexedCollectionInspector',
	#category : 'KesMemoryTools'
}

{ #category : 'KES-Tools' }
KesIndexedCollectionInspector >> becomeNilVariables [

	| result |

	(result := self selectedValue) isNil
		ifFalse: [
			result kesBecomeNil.
			self updateDisplay].
]

{ #category : 'KES-Tools' }
KesIndexedCollectionInspector >> inspectReferences [

	"Inspect the object references to the selected variable."

	self execShortOperation: [
		self selectedValue kesAllReferences kesInspect]
]

{ #category : 'KES-Tools' }
KesIndexedCollectionInspector >> inspectVariable [

	"Inspect the value of the selected variable."

	self execShortOperation: [
		self selectedValue kesInspect]
]

{ #category : 'KES-Tools' }
KesIndexedCollectionInspector >> nilOutVariables [

	| index |

	(self isSelfSelected not and: [(index := self selectedIndexedVariableIndex) notNil])
		ifTrue: [
			self target at: index put: nil.
			self variablesListWidget selectPos: index + 1 notify: true]
]

{ #category : 'KES-Tools' }
KesIndexedCollectionInspector >> optionsMenu [

	^self kesUpdateOptionsMenu: super optionsMenu
]

{ #category : 'KES-Tools' }
KesIndexedCollectionInspector >> releaseWithImpunityVariables [

	| result |

	(result := self selectedValue) isNil
		ifFalse: [
			result kesProcessReleaseWithImpunity.
			self refreshDisplay].
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesIndexedCollectionInspector >> statusLineText [

	^self kesUpdateStatusLineText: super statusLineText
]

{ #category : 'KES-Tools' }
KesIndexedCollectionInspector >> variablesMenu [

	^super variablesMenu
		addLine;
		add: #nilOutVariables label: 'Set to nil' enable: [self selectedValue notNil and: [self isSelfSelected not]];
		add: #becomeNilVariables label: 'Become nil' enable: [self selectedValue notNil and: [self selectedValue abrIsImmutable not]];
		add: #releaseWithImpunityVariables label: 'Cut references to others' enable: [self selectedValue notNil];
		yourself
]
