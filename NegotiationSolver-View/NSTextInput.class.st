"
A text input form field.
"
Class {
	#name : #NSTextInput,
	#superclass : #NSWidget,
	#instVars : [
		'type',
		'title',
		'icon',
		'default',
		'callback'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSTextInput >> callback [
	^ callback
]

{ #category : #accessing }
NSTextInput >> callback: anObject [
	callback := anObject
]

{ #category : #accessing }
NSTextInput >> default [
	^ default
]

{ #category : #accessing }
NSTextInput >> default: anObject [
	default := anObject
]

{ #category : #accessing }
NSTextInput >> icon [
	^ icon
]

{ #category : #accessing }
NSTextInput >> icon: anObject [
	icon := anObject
]

{ #category : #rendering }
NSTextInput >> renderContentOn: html [
	| id |
	id := UUID new asString.
	html div
		class: 'md-form';
		style: 'margin-top:2rem;';
		with: [  
			html icon
				class: 'fal ', self icon, ' prefix'.
			html textInput
				type: self type;
				id: id;
				class: 'form-control';
				value: self default;
				callback: self callback.
			html label 
				for: id;
				with: self title.
		]
		
]

{ #category : #accessing }
NSTextInput >> title [
	^ title
]

{ #category : #accessing }
NSTextInput >> title: anObject [
	title := anObject
]

{ #category : #accessing }
NSTextInput >> type [
	^ type
]

{ #category : #accessing }
NSTextInput >> type: anObject [
	type := anObject
]
