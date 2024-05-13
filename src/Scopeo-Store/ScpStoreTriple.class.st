Class {
	#name : 'ScpStoreTriple',
	#superclass : 'Object',
	#instVars : [
		'subject',
		'predicate',
		'object'
	],
	#category : 'Scopeo-Store',
	#package : 'Scopeo-Store'
}

{ #category : 'instance creation' }
ScpStoreTriple class >> newFrom: aTripleArray [
	"Build a triple from an array of the form: { '?variable' . 'predicate' .object } "

	^ self new
		  subject: aTripleArray first;
		  predicate: aTripleArray second;
		  object: aTripleArray third;
		  yourself
]

{ #category : 'comparing' }
ScpStoreTriple >> = anObject [

	^ self hash = anObject hash
]

{ #category : 'enumerating' }
ScpStoreTriple >> bind: aPattern [
	"Binds the values of a triple with the variables of a pattern and returns the binded variables."

	| variables |
	variables := OrderedCollection new.

	(aPattern subject isNotNil and: [ aPattern subject isVariable ]) ifTrue: [
			variables add: (aPattern subject copy
					 value: self subject;
					 yourself) ].

	(aPattern predicate isNotNil and: [ aPattern predicate isVariable ])
		ifTrue: [
			variables add: (aPattern predicate copy
					 value: self predicate;
					 yourself) ].

	(aPattern object isNotNil and: [ aPattern object isVariable ])
		ifTrue: [
			variables add: (aPattern object copy
					 value: self object;
					 yourself) ].

	^ variables
]

{ #category : 'comparing' }
ScpStoreTriple >> hash [

	^ self subject hash + self predicate hash + self object hash
]

{ #category : 'accessing' }
ScpStoreTriple >> object [

	^ object
]

{ #category : 'accessing' }
ScpStoreTriple >> object: anObject [

	object := anObject
]

{ #category : 'accessing' }
ScpStoreTriple >> predicate [

	^ predicate
]

{ #category : 'accessing' }
ScpStoreTriple >> predicate: anObject [

	predicate := anObject
]

{ #category : 'printing' }
ScpStoreTriple >> printOn: aStream [

	aStream 
		<< self subject asString 
		<< ' - ' << self predicate asString
		<< ' - ' << self object asString
]

{ #category : 'accessing' }
ScpStoreTriple >> subject [

	^ subject
]

{ #category : 'accessing' }
ScpStoreTriple >> subject: anObject [

	subject := anObject
]
