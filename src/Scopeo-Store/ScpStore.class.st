Class {
	#name : 'ScpStore',
	#superclass : 'Object',
	#instVars : [
		'indexes'
	],
	#category : 'Scopeo-Store',
	#package : 'Scopeo-Store'
}

{ #category : 'initialization' }
ScpStore >> initialize [

	indexes := OrderedCollection new.

	indexes add: ScpStoreSPO new.
	indexes add: ScpStoreOSP new.
	indexes add: ScpStorePOS new
]

{ #category : 'accessing' }
ScpStore >> query: aTriplePatterns [

	| selections  |

	aTriplePatterns isEmptyOrNil ifTrue: [ ^ IdentitySet empty ].
	selections := aTriplePatterns collect: [ :p | 
		self select: (ScpStorePattern newFrom: p) 
	].
	
	selections ifEmpty: [ ^ IdentitySet empty ].
	selections size = 1 ifTrue: [ ^ selections first triples ].

	selections sort: [ :a :b | a triples size < b triples size ].
	^ selections reduce: [ :a :b | a join: b ].
	
	
]

{ #category : 'accessing' }
ScpStore >> select: aTriplePattern [

	| selection |
	selection := ScpStoreSelection new.
	selection pattern: aTriplePattern.
	indexes do: [ :i | 
		(i select: aTriplePattern) ifNotEmpty: [ :triples | 
			selection triples: triples.
			^ selection
		] 
	].
	^ selection 
]

{ #category : 'modifying' }
ScpStore >> subject: aSubject predicate: aPredicate object: anObject [

	| triple |
	triple := ScpStoreTriple new
		subject: aSubject;
		predicate: aPredicate;
		object: anObject;
		yourself.
	indexes do: [ :i | i addTriple: triple ]
]
