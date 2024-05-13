Class {
	#name : 'ScpStoreSelection',
	#superclass : 'Object',
	#instVars : [
		'pattern',
		'triples'
	],
	#category : 'Scopeo-Store',
	#package : 'Scopeo-Store'
}

{ #category : 'initialization' }
ScpStoreSelection >> initialize [

	pattern := ScpStorePattern new.
	triples := IdentitySet new
]

{ #category : 'splitjoin' }
ScpStoreSelection >> join: aSelection [
	
	| resultPattern results bindings |

	resultPattern := aSelection pattern deepCopy.
	
	self pattern mask: aSelection pattern.
	aSelection pattern mask: self pattern.
	
	results := self triples.
	results addAll:(self triples flatCollect: [ :t |
		self halt.
		bindings := t bind: self pattern.
		aSelection triples select: [ :st | 
			(bindings includesAnyOf: (st bind: self pattern)) 
		]		
	]).

	^ self class new
		pattern: resultPattern;
		triples: results;
		yourself
]

{ #category : 'accessing' }
ScpStoreSelection >> pattern [

	^ pattern
]

{ #category : 'accessing' }
ScpStoreSelection >> pattern: anObject [

	pattern := anObject
]

{ #category : 'accessing' }
ScpStoreSelection >> size [

	^ triples size
]

{ #category : 'accessing' }
ScpStoreSelection >> triples [

	^ triples
]

{ #category : 'accessing' }
ScpStoreSelection >> triples: anObject [

	triples := anObject
]
