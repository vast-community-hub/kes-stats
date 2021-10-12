Extension {
	#name : 'Time'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'] }
Time >> kesAsExcludedObject [

	^KesTime fromTime: self
]

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
Time >> kesLocalePrintString [
	| stream |

	stream := ReadWriteStream on: Locale default preferredStringClass new.
	Locale default lcTime printTime: self on: stream.
	
	^stream contents
]
