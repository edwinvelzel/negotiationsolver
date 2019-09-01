Class {
	#name : #NSNegotiationFormView,
	#superclass : #NSNegotiationView,
	#instVars : [
		'name',
		'description',
		'type'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSNegotiationFormView >> description [
	^ description
]

{ #category : #accessing }
NSNegotiationFormView >> description: anObject [
	description := anObject
]

{ #category : #accessing }
NSNegotiationFormView >> name [
	^ name
]

{ #category : #accessing }
NSNegotiationFormView >> name: anObject [
	name := anObject
]

{ #category : #accessing }
NSNegotiationFormView >> type [
	^ type
]

{ #category : #accessing }
NSNegotiationFormView >> type: anObject [
	type := anObject
]
