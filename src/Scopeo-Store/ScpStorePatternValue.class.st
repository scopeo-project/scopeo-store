Class {
	#name : 'ScpStorePatternValue',
	#superclass : 'ScpStorePatternContent',
	#category : 'Scopeo-Store',
	#package : 'Scopeo-Store'
}

{ #category : 'comparing' }
ScpStorePatternValue >> = anObject [

	anObject ifNil: [ ^ false ].
	anObject isValue ifFalse: [ ^ false ].
	^ self value = anObject value
]

{ #category : 'testing' }
ScpStorePatternValue >> isValue [

	^ true
]
