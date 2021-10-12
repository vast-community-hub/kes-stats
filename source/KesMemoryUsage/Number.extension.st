Extension {
	#name : 'Number'
}

{ #category : '*KesMemoryUsage',
 #vaCategories : ['KES-Extension'],
  #vaVisibility : 'private' }
Number >> kesLocalePrintString [
	| stream |

	stream := ReadWriteStream on: Locale default preferredStringClass new.
	Locale default lcNumeric printNumber: self on: stream.
	
	^stream contents
]
