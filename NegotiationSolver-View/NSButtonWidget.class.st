Class {
	#name : #NSButtonWidget,
	#superclass : #NSWidget,
	#instVars : [
		'type',
		'classes',
		'attributes',
		'callback',
		'with'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSButtonWidget >> attributes [
	^ attributes
]

{ #category : #accessing }
NSButtonWidget >> attributes: anObject [
	attributes := anObject
]

{ #category : #accessing }
NSButtonWidget >> callback [
	^ callback
]

{ #category : #accessing }
NSButtonWidget >> callback: anObject [
	callback := anObject
]

{ #category : #accessing }
NSButtonWidget >> classes [
	^ classes
]

{ #category : #accessing }
NSButtonWidget >> classes: anObject [
	classes := anObject
]

{ #category : #initializing }
NSButtonWidget >> initialize [
	super initialize.
	type := 'button'.
	classes := 'btn'.
	attributes := #().
	callback := [  ].
	with := [  ].
	
]

{ #category : #rendering }
NSButtonWidget >> renderContentOn: html [
	| btn |
	btn := html button.
	btn type: self type.
	btn class: self classes.
	btn callback: self callback.
	self attributes do: [ :attribute |
		btn attributeAt: (attribute at: 1) put: (attribute at: 2).
	].
	btn with: self with.

]

{ #category : #accessing }
NSButtonWidget >> type [
	^ type
]

{ #category : #accessing }
NSButtonWidget >> type: anObject [
	type := anObject
]

{ #category : #accessing }
NSButtonWidget >> with [
	^ with
]

{ #category : #accessing }
NSButtonWidget >> with: anObject [
	with := anObject
]
