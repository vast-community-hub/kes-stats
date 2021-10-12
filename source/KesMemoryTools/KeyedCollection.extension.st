Extension {
	#name : 'KeyedCollection'
}

{ #category : '*KesMemoryTools',
 #vaCategories : ['KES-Extension','KES-Tools'] }
KeyedCollection >> kesInspect [
		"Open a dictionary inspector on the receiver."

	(KesDictionaryInspector on: self kesAsExcludedObject) 
		owningImage: System image;
		open
]
