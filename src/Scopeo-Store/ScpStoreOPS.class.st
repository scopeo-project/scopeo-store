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

	aPattern object isVariable ifTrue: [ ^ Set empty ].
	selection := triples at: aPattern object value ifAbsent: [ ^ Set empty ].

	aPattern predicate isVariable ifTrue: [
		^ selection flatCollectAsSet: [ :a | a ] 
	].
	
	^ selection at: aPattern predicate value ifAbsent: [ ^ Set empty ]
]
