"
I'm a picker of labels , i take the first letters of a string. 
If the string contains an extension, then we keep it(see the **Example 3**).

**By default I take the first 8 letters:** 
```Smalltalk
LbCContractor new
	pickFirstLetters;
	reduce: 'HashedCollection'.		
```
returns 'HashedCo..'

**An example to change the number of letter:**
```Smalltalk
LbCContractor new
	pickFirstLettersUpTo: 5;
	reduce: 'HashedCollection'.		
```
returns 'Hashe..'

**Example 3: reducing a string representing a file**
```Smalltalk
LbCContractor new
	pickFirstLetters;
	reduce: 'HashedCollection.class'.		
```
returns 'HashedCo.class'

**An other example to keep path if a fully qualified name: **
```Smalltalk
LbCContractor new
	pickFirstLetters;
	keepPath;
	reduce: 'fully/qualified/name/HashedCollection.class'.		
```
returns 'fully/qualified/name/HashedCo.class'
"
Class {
	#name : #LbCPickFirstCharactersStrategy,
	#superclass : #LbCSizeReductionStrategy,
	#category : 'LabelContractor-Contractor'
}

{ #category : #scripts }
LbCPickFirstCharactersStrategy class >> exampleRoassal [
	
	<example>
	| contractor |
	contractor := LbCContractor new strategy: self new.
	LbCContractorScript new exampleRoassal: contractor
]

{ #category : #scripts }
LbCPickFirstCharactersStrategy class >> exampleSpec [
	
	<example>
	| contractor |
	contractor := LbCContractor new strategy: self new.
	LbCContractorScript new exampleSpec: contractor
]

{ #category : #accessing }
LbCPickFirstCharactersStrategy class >> priority [
	
	^ 20
]

{ #category : #'reduce-label' }
LbCPickFirstCharactersStrategy >> privateReduce: aString extension: extensionAsString [

	"Take the first letters of the string(by default i take the 8 first letters). If the suffix of the string represents an extension of a file (eg:'.txt', '.st' ...), then i keep it"

	^ self upTo >= aString size
		  ifTrue: [ aString ] "string smaller than the chosen size" 
		  ifFalse: [ 
			  | pickFirstLetters |
			  pickFirstLetters := aString copyFrom: 1 to: self upTo.
			  extensionAsString isEmpty
				  ifTrue: [ pickFirstLetters , '..' ]
				  ifFalse: [ pickFirstLetters , extensionAsString ] ]
]