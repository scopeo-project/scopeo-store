Class {
	#name : 'BaselineOfScopeoStore',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfScopeoStore',
	#package : 'BaselineOfScopeoStore'
}

{ #category : 'baselines' }
BaselineOfScopeoStore >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec package: 'Scopeo-Store']
]
