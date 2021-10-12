Class {
	#name : 'KesDebugInspector',
	#superclass : 'DbgInspector',
	#category : 'KesMemoryTools'
}

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesDebugInspector class >> kesIncludeInInstanceCount [

	^false
]

{ #category : 'KES-Tools' }
KesDebugInspector class >> on: anObject [

	"Answer an inspector on anObject. If the object's size exceeds what is reasonable to show in a 
	 hiearchical view create and answer a non-hierarchical inspector."

	anObject inspectorSize > DbgInspectedObject maximumSize
		ifTrue: [^KesInspector on: anObject].

	^self new
		initializeTarget: anObject;
		yourself
]

{ #category : 'KES-Tools' }
KesDebugInspector >> becomeNilVariables [

	| result |

	(result := self collectValues: self selectedVariables) isNil
		ifFalse: [
			self isOneValueSelected
				ifTrue: [result first kesBecomeNil]
				ifFalse: [result do: [:obj | obj kesBecomeNil]].
			self refreshDisplay].
]

{ #category : 'KES-Tools' }
KesDebugInspector >> inspectReferences [

	"Inspect the object references to the selected variable."

	self execShortOperation: [
		| referencesByHierarchy value failed |
		referencesByHierarchy := self variablesListWidget items collect: [:obj | obj reference].

		failed := false.
		value := self retrieveValue: self selectedVariable ifFail: [failed := true].

		failed
			ifTrue: [self closeCorruptBrowser]
			ifFalse: [
				(value kesAllReferences reject: [:reference | referencesByHierarchy includes: reference]) kesAsExcludedObject
					kesInspect]]
]

{ #category : 'KES-Tools' }
KesDebugInspector >> inspectVariable [

	"Inspect the value of the selected variable."

	self execShortOperation: [
		| result |
		(result := self collectValues: self selectedVariables) isNil
			ifTrue: [self closeCorruptBrowser]
			ifFalse: [
				self isOneValueSelected
					ifTrue: [result first kesInspect]
					ifFalse: [result kesInspect]]]
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesDebugInspector >> kesUpdateStatusLineText: text [

	^(KesInspector kesDisplayMemoryUsage and: [self selectedVariables notEmpty])
		ifTrue: [text, ', ', (self selectedVariables inject: 0 into: [:sum :var| sum + var value sizeOfRepresentation]) kesLocalePrintString, ' bytes']
		ifFalse: [text]
]

{ #category : 'KES-Tools' }
KesDebugInspector >> nilOutVariables [

	| result |

	(result := self selectedVariables) isNil
		ifFalse: [
			self isOneValueSelected
				ifTrue: [result first value: nil]
				ifFalse: [result do: [:obj | obj value: nil]].
			self refreshDisplay].
]

{ #category : 'KES-Tools' }
KesDebugInspector >> optionsMenu [

	^self kesUpdateOptionsMenu: super optionsMenu
]

{ #category : 'KES-Tools' }
KesDebugInspector >> releaseWithImpunityVariables [

	| result |

	(result := self collectValues: self selectedVariables) isNil
		ifFalse: [
			self isOneValueSelected
				ifTrue: [result first kesProcessReleaseWithImpunity]
				ifFalse: [result do: [:obj | obj kesProcessReleaseWithImpunity]].
			self refreshDisplay].
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesDebugInspector >> statusLineText [

	^self kesUpdateStatusLineText: super statusLineText
]

{ #category : 'KES-Tools' }
KesDebugInspector >> toggleDisplayMemoryUsage [

	KesInspector kesDisplayMemoryUsage: KesInspector kesDisplayMemoryUsage not.
	self updateStatusLine
]

{ #category : 'KES-Tools' }
KesDebugInspector >> variableDoubleSelected [

	"The user has double-clicked an item in the variables hierarchy list, update the list as 
	 required."

	self execShortOperation: [
		| item vars |
		((vars := self selectedVariables) size == 1 and: [(item := vars first) hasChildren not])
			ifTrue: [
				| value failed |
				failed := false.
				value := self retrieveValue: item ifFail: [failed := true].
				failed
					ifTrue: [self closeCorruptBrowser]
					ifFalse: [value kesInspect]]
			ifFalse: [
				| failed |
				failed := false.
				[self variablesListWidget hideShow]
					when: ExError
					do: [:ex |
						failed := true.
						ex exitWith: nil].

				"Forward the new selection and update."
				failed
					ifTrue: [self closeCorruptBrowser]
					ifFalse: [self variablesSelected: self variablesListWidget selectedItems]]]
]

{ #category : 'KES-Tools' }
KesDebugInspector >> variablesMenu [

	^super variablesMenu
		addLine;
		add: #nilOutVariables label: 'Set to nil' enable: [self dirty not and: [self selectedVariables size >= 1]];
		add: #becomeNilVariables label: 'Become nil' enable: [self dirty not and: [self selectedVariables size >= 1 and: [self selectedVariables conform: [:var| var value abrIsImmutable not]]]];
		add: #releaseWithImpunityVariables label: 'Cut references to others' enable: [self dirty not and: [self selectedVariables size >= 1]];
		yourself
]
