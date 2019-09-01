"
An option to use in choice widgets.
"
Class {
	#name : #NSOption,
	#superclass : #Object,
	#instVars : [
		'value',
		'text'
	],
	#category : #'NegotiationSolver-Model'
}

{ #category : #'instance creation' }
NSOption class >> new: aValueString text: aTextString [
	| option |
	option := self basicNew.
	option value: aValueString.
	option text: aTextString.
	^ option
]

{ #category : #printing }
NSOption >> printString [ 
	^ self text.
]

{ #category : #accessing }
NSOption >> text [
	^ text
]

{ #category : #accessing }
NSOption >> text: aString [
	text := aString.
]

{ #category : #accessing }
NSOption >> value [
	^ value
]

{ #category : #accessing }
NSOption >> value: aString [
	value := aString.
]
