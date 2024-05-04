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
	"
	Join the current selection triples with the triples of the selection in argument.
	1. Check the intersection of the variables of the two selections.
	2. Iterate over the smallest selection's triples and checks the bindings of the variables (from the intersection).
	3. Iterate over the largest selection's triples and checks the bindings of the variables and select those who match with point 2.
	"
	| small large result bindings |
	
	small := self.
	large := aSelection.
	small size > large size ifTrue: [
		small := aSelection.
		large := self ].

	result := IdentitySet newFrom: small triples.

	small pattern mask: large pattern.
	large pattern mask: small pattern.

	small triples do: [ :st |
		bindings := st bind: small pattern.
		result addAll: (large triples select: [ :lt |
			bindings includesAll: (lt bind: large pattern) 
		]) 
	].

	^ self class new 
		pattern: large pattern; 
		triples: result;
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
