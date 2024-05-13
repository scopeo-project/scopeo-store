"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestScopeoStore',
	#superclass : 'PackageManifest',
	#category : 'Scopeo-Store-Manifest',
	#package : 'Scopeo-Store',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestScopeoStore class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#ScpStoreSelection #join: #false)) #'2024-05-05T17:30:19.850168+02:00') )
]
