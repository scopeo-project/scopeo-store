Class {
	#name : 'ScpStorePSO',
	#superclass : 'ScpStoreIndex',
	#category : 'Scopeo-Store',
	#package : 'Scopeo-Store'
}

{ #category : 'modifying' }
ScpStorePSO >> addTriple: aTriple [

	self at: aTriple predicate at: aTriple subject putTriple: aTriple
]

{ #category : 'accessing' }
ScpStorePSO >> select: aPattern [

	| selection |

	aPattern predicate isVariable ifTrue: [ ^ IdentitySet empty ].
	selection := triples at: aPattern predicate value ifAbsent: [ ^ IdentitySet empty ].

	aPattern subject isVariable ifTrue: [
		^ selection flatCollectAsSet: [ :a | a ] 
	].
	
	^ selection at: aPattern subject value ifAbsent: [ ^ IdentitySet empty ]
]
