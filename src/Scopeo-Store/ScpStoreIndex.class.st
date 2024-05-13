Class {
	#name : 'ScpStoreIndex',
	#superclass : 'Object',
	#instVars : [
		'triples'
	],
	#category : 'Scopeo-Store',
	#package : 'Scopeo-Store'
}

{ #category : 'testing' }
ScpStoreIndex class >> isAbstract [

	^ self == ScpStoreIndex
]

{ #category : 'modifying' }
ScpStoreIndex >> addTriple: aTriple [

	self subclassResponsibility
]

{ #category : 'private - modifying' }
ScpStoreIndex >> at: aFirstKey at: aSecondKey putTriple: aTriple [

	| objects |
	objects := triples
		           at: aFirstKey
		           at: aSecondKey
		           ifAbsentPut: [ Set empty ].
	objects add: aTriple
]

{ #category : 'initialization' }
ScpStoreIndex >> initialize [

	triples := Dictionary new
]

{ #category : 'accessing' }
ScpStoreIndex >> select: aTriplePattern [

	self subclassResponsibility
]
