Class {
	#name : 'KesAnalysisBlockTest',
	#superclass : 'KesAnalysisTest',
	#instVars : [
		'block',
		'displayName'
	],
	#category : 'KesMemoryUsage'
}

{ #category : 'KES-Internal' }
KesAnalysisBlockTest >> block [

	^block
]

{ #category : 'KES-Internal' }
KesAnalysisBlockTest >> block: aBlock [

	block := aBlock.
]

{ #category : 'KES-Internal' }
KesAnalysisBlockTest >> displayName [

	(displayName isNil) 
		ifTrue: [^'Block']
		ifFalse: [^displayName]
]

{ #category : 'KES-Internal' }
KesAnalysisBlockTest >> displayName: aString [

	displayName := aString
]

{ #category : 'KES-Internal',
  #vaVisibility : 'private' }
KesAnalysisBlockTest >> performTest [

	| result |

	result := self block value.
	(result isString) ifTrue: [self resultString: result].

	^super performTest
]
