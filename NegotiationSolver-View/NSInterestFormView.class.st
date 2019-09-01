Class {
	#name : #NSInterestFormView,
	#superclass : #NSInterestView,
	#instVars : [
		'name',
		'description',
		'importance'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSInterestFormView >> description [
	^ description
]

{ #category : #accessing }
NSInterestFormView >> description: anObject [
	description := anObject
]

{ #category : #accessing }
NSInterestFormView >> importance [
	^ importance
]

{ #category : #accessing }
NSInterestFormView >> importance: anObject [
	importance := anObject
]

{ #category : #accessing }
NSInterestFormView >> name [
	^ name
]

{ #category : #accessing }
NSInterestFormView >> name: anObject [
	name := anObject
]
