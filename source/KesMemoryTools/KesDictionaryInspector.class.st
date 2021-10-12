Class {
	#name : 'KesDictionaryInspector',
	#superclass : 'EtDictionaryInspector',
	#category : 'KesMemoryTools'
}

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesDictionaryInspector >> computeNamedVariables [

	^((self target isKindOf: EsOrderedDictionary) or: [self target isKindOf: EsIndexedDictionary])
		ifTrue: [self computeOrderedNamedVariables]
		ifFalse: [super computeNamedVariables]
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesDictionaryInspector >> computeOrderedNamedVariables [

	"Private - Compute the named variables."

	| mapping |
	variables := self target keys.
	variableNames := OrderedCollection new: variables size.
	mapping := self target species new: variables size * 2.
	variables do: [: key |
		mapping at: key put: (variableNames add: key printString)]
]

{ #category : 'KES-Tools' }
KesDictionaryInspector >> inspectPoolReferences [

	"Inspect the classes which reference the selected pool dictionary."
	
	| key |
	(key := self selectedKey) notNil ifTrue: [
		self execShortOperation: [
			| references |
			references :=
				self owningImage allClasses select: [:cl |
					cl sharedPoolNames includes: key].
			references isEmpty
				ifTrue: [
					self owningImage message: 
						(MxEST47		"$NLS$ No classes declare %1 as a shared pool."
							bindWith: key printString)]
				ifFalse: [references kesInspect]]]
]

{ #category : 'KES-Tools' }
KesDictionaryInspector >> inspectReferences [

	"Inspect the object references to the selected variable."

	self execShortOperation: [
		self selectedValue kesAllReferences kesInspect]
]

{ #category : 'KES-Tools' }
KesDictionaryInspector >> inspectVariable [

	"Inspect the value of the selected variable."

	self execShortOperation: [
		self selectedValue kesInspect]
]

{ #category : 'KES-Tools' }
KesDictionaryInspector >> optionsMenu [

	^self kesUpdateOptionsMenu: super optionsMenu
]

{ #category : 'KES-Tools',
  #vaVisibility : 'private' }
KesDictionaryInspector >> statusLineText [

	^self kesUpdateStatusLineText: super statusLineText
]
