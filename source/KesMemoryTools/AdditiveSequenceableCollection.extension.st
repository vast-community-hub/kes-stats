Extension {
	#name : 'AdditiveSequenceableCollection'
}

{ #category : '*KesMemoryTools',
 #vaCategories : ['KES-Extension','KES-Tools'] }
AdditiveSequenceableCollection >> kesInspect [
		"Open an indexed collection inspector on the receiver."

	(KesIndexedCollectionInspector on: self kesAsExcludedObject) 
		owningImage: System image;
		open
]
