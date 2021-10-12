Extension {
	#name : 'Date'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
Date >> kesLocalePrintString [
	| stream |

	stream := ReadWriteStream on: Locale default preferredStringClass new.
	Locale default lcTime printDate: self on: stream.
	
	^stream contents
]
