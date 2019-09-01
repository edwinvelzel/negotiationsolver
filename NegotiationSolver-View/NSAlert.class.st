Class {
	#name : #NSAlert,
	#superclass : #NSWidget,
	#instVars : [
		'text',
		'classes'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSAlert >> classes [
	^ classes
]

{ #category : #accessing }
NSAlert >> classes: anObject [
	classes := anObject
]

{ #category : #rendering }
NSAlert >> renderContentOn: html [ 
	| timer |
	timer := 'delay-5s'.
	((self text findString: 'danger') > 0) ifTrue: [ timer := 'infinite' ].
	html div
		class: 'alert fadeOut ', timer, ' ', self classes;
		with: [ 
			html text: self text.
		].
]

{ #category : #accessing }
NSAlert >> text [
	^ text
]

{ #category : #accessing }
NSAlert >> text: anObject [
	text := anObject
]
