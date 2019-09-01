"
Contains the general data and methods for Negotiation forms.
"
Class {
	#name : #NSNegotiationFormPage,
	#superclass : #NSPage,
	#instVars : [
		'name',
		'description',
		'type',
		'importance'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSNegotiationFormPage >> description [
	^ description
]

{ #category : #accessing }
NSNegotiationFormPage >> description: aString [
	description := aString.
]

{ #category : #accessing }
NSNegotiationFormPage >> name [
	^ name
]

{ #category : #accessing }
NSNegotiationFormPage >> name: aString [
	name := aString.
]

{ #category : #accessing }
NSNegotiationFormPage >> type [
	(type isNil) ifTrue: [ type := 'single-sided' ].
	^ type
]

{ #category : #accessing }
NSNegotiationFormPage >> type: aString [
	type := aString.
]
