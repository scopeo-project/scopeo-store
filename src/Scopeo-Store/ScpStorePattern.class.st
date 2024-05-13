Class {
	#name : 'ScpStorePattern',
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
ScpStorePattern class >> newFrom: aTripleArray [
	"Build a triple from an array of the form: { '?variable' . 'predicate' .object } "

	^ self new
		  subject: (ScpStorePatternContent newFrom: aTripleArray first);
		  predicate: (ScpStorePatternContent newFrom: aTripleArray second);
		  object: (ScpStorePatternContent newFrom: aTripleArray third);
		  yourself
]

{ #category : 'accessing' }
ScpStorePattern >> intersection: aPattern [
	"Return all variables that are common to the current pattern AND the one in argument."
	
	| variables |
	variables := aPattern variables.
	^ self variables select: [ :v | 
		 variables includes: v 
	].
]

{ #category : 'modifying' }
ScpStorePattern >> mask: aPattern [
	"Clean the slots that do not contain a variable included in the pattern passed as argument."

	(self intersection: aPattern) do: [ :v |
		self subject = v ifFalse: [ self subject: nil ].
		self predicate = v ifFalse: [ self predicate: nil ].
		self object = v ifFalse: [ self object: nil ].	
	]
]

{ #category : 'accessing' }
ScpStorePattern >> object [

	^ object
]

{ #category : 'accessing' }
ScpStorePattern >> object: anObject [

	object := anObject
]

{ #category : 'accessing' }
ScpStorePattern >> predicate [

	^ predicate
]

{ #category : 'accessing' }
ScpStorePattern >> predicate: anObject [

	predicate := anObject
]

{ #category : 'printing' }
ScpStorePattern >> printOn: aStream [

	aStream 
		<< self subject asString 
		<< ' - ' << self predicate asString
		<< ' - ' << self object asString
]

{ #category : 'accessing' }
ScpStorePattern >> subject [

	^ subject
]

{ #category : 'accessing' }
ScpStorePattern >> subject: anObject [

	subject := anObject
]

{ #category : 'accessing' }
ScpStorePattern >> variables [
	"Return the variables of the current pattern"

	^ {
		  self subject.
		  self predicate.
		  self object 
	  } select: [ :i | i isNotNil and: [ i isVariable ] ]
]
