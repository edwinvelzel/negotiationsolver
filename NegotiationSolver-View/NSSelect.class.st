Class {
	#name : #NSSelect,
	#superclass : #NSWidget,
	#instVars : [
		'title',
		'icon',
		'instruction',
		'options',
		'selected',
		'callback'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSSelect >> callback [
	^ callback
]

{ #category : #accessing }
NSSelect >> callback: anObject [
	callback := anObject
]

{ #category : #accessing }
NSSelect >> icon [
	^ icon
]

{ #category : #accessing }
NSSelect >> icon: anObject [
	icon := anObject
]

{ #category : #accessing }
NSSelect >> instruction [
	^ instruction
]

{ #category : #accessing }
NSSelect >> instruction: anObject [
	instruction := anObject
]

{ #category : #accessing }
NSSelect >> options [
	^ options
]

{ #category : #accessing }
NSSelect >> options: anObject [
	options := anObject
]

{ #category : #rendering }
NSSelect >> renderContentOn: html [
	| id |
	id := UUID new asString.
	html div 
		class: 'md-form';
		style: 'margin-top: 2rem;';
		with: [  
			html icon
				class: 'prefix fal ', self icon.
			html label
				class: 'active';
				style: 'top:-0.75rem;';
				for: id;
				with: [ html text: self title ].
			html select 
				id: id;
				class: 'browser-default custom-select';
				style: 'margin-left: 2.5rem;width: calc(100% - 2.5rem);border:none;border-bottom:1px solid lightgrey;';
				list: self options;
				selected: self selected;
				callback: self callback.
		].

]

{ #category : #accessing }
NSSelect >> selected [
	^ selected
]

{ #category : #accessing }
NSSelect >> selected: anObject [
	selected := anObject
]

{ #category : #accessing }
NSSelect >> title [
	^ title
]

{ #category : #accessing }
NSSelect >> title: anObject [
	title := anObject
]
