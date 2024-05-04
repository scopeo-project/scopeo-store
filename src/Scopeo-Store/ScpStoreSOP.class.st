Class {
	#name : 'ScpStoreSOP',
	#superclass : 'ScpStoreIndex',
	#category : 'Scopeo-Store',
	#package : 'Scopeo-Store'
}

{ #category : 'modifying' }
ScpStoreSOP >> addTriple: aTriple [

	self at: aTriple subject at: aTriple object putTriple: aTriple
]

{ #category : 'accessing' }
ScpStoreSOP >> select: aPattern [

	| selection |

	aPattern subject isVariable ifTrue: [ ^ IdentitySet empty ].
	selection := triples at: aPattern subject value ifAbsent: [ ^ IdentitySet empty ].

	aPattern object isVariable ifTrue: [
		^ selection flatCollectAsSet: [ :a | a ] 
	].
	
	^ selection at: aPattern object value ifAbsent: [ ^ IdentitySet empty ]
]
