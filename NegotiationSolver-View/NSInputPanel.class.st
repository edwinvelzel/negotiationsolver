"
A Panel for input forms.
"
Class {
	#name : #NSInputPanel,
	#superclass : #NSWidget,
	#instVars : [
		'title',
		'icon',
		'with'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSInputPanel >> icon [
	^ icon
]

{ #category : #accessing }
NSInputPanel >> icon: anObject [
	icon := anObject
]

{ #category : #accessing }
NSInputPanel >> renderContentOn: html [
	html div
		class: 'card';
		style: 'margin: 10%';
		with: [  
			html heading 
				level: 5;
				class: 'card-header black white-text text-center';
				with: [  
					html icon 
						class: 'fal ', self icon.
					html strong 
						with: [ html text: '  ', self title ].
				].
			html div
				class: 'card-body px-lg pt-0';
				with: self with.
		]
		
]

{ #category : #accessing }
NSInputPanel >> title [
	^ title
]

{ #category : #accessing }
NSInputPanel >> title: anObject [
	title := anObject
]

{ #category : #accessing }
NSInputPanel >> with [
	^ with
]

{ #category : #accessing }
NSInputPanel >> with: anObject [
	with := anObject
]
