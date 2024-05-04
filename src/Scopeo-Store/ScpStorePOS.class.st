Class {
	#name : 'ScpStorePOS',
	#superclass : 'ScpStoreIndex',
	#category : 'Scopeo-Store',
	#package : 'Scopeo-Store'
}

{ #category : 'modifying' }
ScpStorePOS >> addTriple: aTriple [

	self at: aTriple predicate at: aTriple object putTriple: aTriple
]

{ #category : 'accessing' }
ScpStorePOS >> select: aPattern [

	| selection |

	aPattern predicate isVariable ifTrue: [ ^ IdentitySet empty ].
	selection := triples at: aPattern predicate value ifAbsent: [ ^ IdentitySet empty ].

	aPattern object isVariable ifTrue: [
		^ selection flatCollectAsSet: [ :a | a ] 
	].
	
	^ selection at: aPattern object value ifAbsent: [ ^ IdentitySet empty ]
]
