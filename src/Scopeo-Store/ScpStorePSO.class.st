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

	aPattern predicate isVariable ifTrue: [ ^ Set empty ].
	selection := triples at: aPattern predicate value ifAbsent: [ ^ Set empty ].

	aPattern subject isVariable ifTrue: [
		^ selection flatCollectAsSet: [ :a | a ] 
	].
	
	^ selection at: aPattern subject value ifAbsent: [ ^ Set empty ]
]
