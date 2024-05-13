Class {
	#name : 'ScpStoreOSP',
	#superclass : 'ScpStoreIndex',
	#category : 'Scopeo-Store',
	#package : 'Scopeo-Store'
}

{ #category : 'modifying' }
ScpStoreOSP >> addTriple: aTriple [

	self at: aTriple object at: aTriple subject putTriple: aTriple
]

{ #category : 'accessing' }
ScpStoreOSP >> select: aPattern [

	| selection |

	aPattern object isVariable ifTrue: [ ^ Set empty ].
	selection := triples at: aPattern object value ifAbsent: [ ^ Set empty ].

	aPattern subject isVariable ifTrue: [
		^ selection flatCollectAsSet: [ :a | a ] 
	].
	
	^ selection at: aPattern subject value ifAbsent: [ ^ Set empty ]
]
