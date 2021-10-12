Extension {
	#name : 'KesMemoryConsumptionView'
}

{ #category : '*KesMemoryTools',
 #vaCategories : ['KES-Extension','KES-Tools'],
  #vaVisibility : 'private' }
KesMemoryConsumptionView >> openFixedFontWorkspace: aTitle [

	| ws fontNames fontStruct |

	ws := EtWorkspace new open.

	fontNames := CgDisplay default 
		listFonts: ((CgLogicalFontDescription wildCard) spacing: 'm'; points: '80'; weight: 'medium'; slant: 'r'; name)
		maxnames: 1.
	fontStruct := CgDisplay default loadQueryFont: (fontNames at: 1).
	ws fontSettableWidgets do: [:widget| 
			widget fontList: (CwFontList fontStruct: fontStruct)].

	ws shell title: aTitle.
	ws nextPutAll: aTitle; cr.

	^ws
]
