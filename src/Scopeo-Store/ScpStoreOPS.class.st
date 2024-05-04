Class {
	#name : 'ScpStoreOPS',
	#superclass : 'ScpStoreIndex',
	#category : 'Scopeo-Store',
	#package : 'Scopeo-Store'
}

{ #category : 'modifying' }
ScpStoreOPS >> addTriple: aTriple [

	self at: aTriple object at: aTriple predicate putTriple: aTriple 
]

{ #category : 'accessing' }
ScpStoreOPS >> select: aPattern [

	| selection |

	aPattern object isVariable ifTrue: [ ^ IdentitySet empty ].
	selection := triples at: aPattern object value ifAbsent: [ ^ IdentitySet empty ].

	aPattern predicate isVariable ifTrue: [
		^ selection flatCollectAsSet: [ :a | a ] 
	].
	
	^ selection at: aPattern predicate value ifAbsent: [ ^ IdentitySet empty ]
]
