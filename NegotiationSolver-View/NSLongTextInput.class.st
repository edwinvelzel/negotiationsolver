Class {
	#name : #NSLongTextInput,
	#superclass : #NSWidget,
	#instVars : [
		'title',
		'icon',
		'rows',
		'default',
		'callback'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSLongTextInput >> callback [
	^ callback
]

{ #category : #accessing }
NSLongTextInput >> callback: anObject [
	callback := anObject
]

{ #category : #accessing }
NSLongTextInput >> default [
	^ default
]

{ #category : #accessing }
NSLongTextInput >> default: anObject [
	default := anObject
]

{ #category : #accessing }
NSLongTextInput >> icon [
	^ icon
]

{ #category : #accessing }
NSLongTextInput >> icon: anObject [
	icon := anObject
]

{ #category : #rendering }
NSLongTextInput >> renderContentOn: html [
	| id |
	id := UUID new asString.
	html div 
		class: 'md-form';
		style: 'margin-top:1.5rem;';
		with: [ 
			html icon
				class: 'fal ', self icon, ' prefix'.
			html textArea 
				id: id;
				class: 'md-textarea form-control';
				rows: self rows;
				callback: self callback;
				with: [ html text: self default ].
			html label
				for: id;
				with: [ html text: self title ].			
		].

]

{ #category : #accessing }
NSLongTextInput >> rows [
	^ rows
]

{ #category : #accessing }
NSLongTextInput >> rows: anObject [
	rows := anObject
]

{ #category : #accessing }
NSLongTextInput >> title [
	^ title
]

{ #category : #accessing }
NSLongTextInput >> title: anObject [
	title := anObject
]
