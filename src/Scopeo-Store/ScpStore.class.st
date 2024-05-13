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

	| selections bindings results |

	aTriplePatterns isEmptyOrNil ifTrue: [ ^ IdentitySet empty ].
	selections := aTriplePatterns collect: [ :p | 
		self select: (ScpStorePattern newFrom: p) 
	].
	
	selections ifEmpty: [ ^ IdentitySet empty ].
	selections size = 1 ifTrue: [ ^ selections first triples ].

	bindings := Dictionary new.
	results := selections first triples.
	
	(selections first triples flatCollect: [ :t |
		t bind: selections first pattern
	]) do: [ :b |
		(bindings at: b name ifAbsentPut: [ IdentitySet new ]) add: b value	
	].

	(2 to: selections size) do: [ :i |
		| selection temp |
		selection := selections at: i.
		temp := selection triples select: [ :t | 
			(t bind: selection pattern) detect: [ :b |
				bindings at: b name 
					ifPresent: [ :vs | vs includes: b value ] 
					ifAbsent: [ false ]
			] ifFound: [ true ] ifNone: [ false ] 
		].
		results addAll: temp.
		temp do: [ :t | (t bind: selection pattern) do: [ :b | 
				bindings at: b name ifAbsentPut: [ IdentitySet new ].
				((bindings at: b name) includes: b value ) ifFalse: [ 
					(bindings at: b name) add: b value
				]
		 ] ].
	].

	^ results
	
	
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
