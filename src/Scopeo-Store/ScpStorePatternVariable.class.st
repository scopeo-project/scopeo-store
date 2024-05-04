Class {
	#name : 'ScpStorePatternVariable',
	#superclass : 'ScpStorePatternContent',
	#instVars : [
		'name'
	],
	#category : 'Scopeo-Store',
	#package : 'Scopeo-Store'
}

{ #category : 'comparing' }
ScpStorePatternVariable >> = anObject [

	anObject ifNil: [ ^ false ].
	anObject isVariable ifFalse: [ ^ false ].
	^ self name = anObject name and: [ self value = anObject value ]
]

{ #category : 'testing' }
ScpStorePatternVariable >> isVariable [

	^ true
]

{ #category : 'accessing' }
ScpStorePatternVariable >> name [

	^ name
]

{ #category : 'accessing' }
ScpStorePatternVariable >> name: aName [

	name := aName
]
