Class {
	#name : 'ScpStoreSPO',
	#superclass : 'ScpStoreIndex',
	#category : 'Scopeo-Store',
	#package : 'Scopeo-Store'
}

{ #category : 'modifying' }
ScpStoreSPO >> addTriple: aTriple [

	self at: aTriple subject at: aTriple predicate putTriple: aTriple
]

{ #category : 'accessing' }
ScpStoreSPO >> select: aPattern [

	| selection |

	(aPattern subject isVariable 
		and: [ aPattern predicate isVariable 
			and: [ aPattern object isVariable ] ]) 
		ifTrue: [
			^ triples flatCollect: [ :d | d flatCollectAsSet: [ :v | v ] ] 
		].

	aPattern subject isVariable ifTrue: [ ^ IdentitySet empty ].
	selection := triples at: aPattern subject value ifAbsent: [ ^ IdentitySet empty ].

	aPattern predicate isVariable ifTrue: [
		^ selection flatCollectAsSet: [ :a | a ] 
	].
	
	^ selection at: aPattern predicate value ifAbsent: [ ^ IdentitySet empty ]
]
