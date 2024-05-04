Class {
	#name : 'ScpStorePatternContent',
	#superclass : 'Object',
	#instVars : [
		'value'
	],
	#category : 'Scopeo-Store',
	#package : 'Scopeo-Store'
}

{ #category : 'testing' }
ScpStorePatternContent class >> isAbstract [

	^ self == ScpStorePatternContent
]

{ #category : 'instance creation' }
ScpStorePatternContent class >> newFrom: anObject [

	(anObject isString and: [ anObject beginsWith: '?' ]) ifTrue: [ 
		^ ScpStorePatternVariable new 
			name: anObject;
			yourself
	].

	^ ScpStorePatternValue new 
			value: anObject; 
			yourself
]

{ #category : 'testing' }
ScpStorePatternContent >> isValue [

	^ false
]

{ #category : 'testing' }
ScpStorePatternContent >> isVariable [

	^ false
]

{ #category : 'accessing' }
ScpStorePatternContent >> value [

	^ value
]

{ #category : 'accessing' }
ScpStorePatternContent >> value: anObject [

	value := anObject
]
