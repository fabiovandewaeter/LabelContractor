Class {
	#name : #LbCSubstituteSubstringsStrategyTest,
	#superclass : #LbCAbstractStrategyTest,
	#category : 'LabelContractor-Tests'
}

{ #category : #creation }
LbCSubstituteSubstringsStrategyTest >> classToTest [
	
	^ LbCSubstituteSubstringsStrategy
]

{ #category : #tests }
LbCSubstituteSubstringsStrategyTest >> testSubstituteFrom [
	
	| contractor |
	contractor := self classToTest new oldSubstring: '' newSubstring: ''. 
	self assert: (contractor substituteFrom: exampleString) equals: exampleString.
	
	contractor := self classToTest new oldSubstring: '' newSubstring: 'something'. 
	self assert: (contractor substituteFrom: exampleString) equals: exampleString.

	contractor := self classToTest new oldSubstring: 'OfAClass' newSubstring: 'Clss'. 
	self assert: (contractor substituteFrom: exampleString) equals: 'AnExampleClss.txt'.
	
]
