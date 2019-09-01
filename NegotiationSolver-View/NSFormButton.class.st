Class {
	#name : #NSFormButton,
	#superclass : #NSWidget,
	#instVars : [
		'title',
		'icon',
		'classes',
		'callback',
		'onClick',
		'type'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSFormButton >> callback [ 	
	^ callback
]

{ #category : #accessing }
NSFormButton >> callback: aBlock [
	callback := aBlock
]

{ #category : #accessing }
NSFormButton >> classes [ 	
	^ classes
]

{ #category : #accessing }
NSFormButton >> classes: aString [	
	classes := aString
]

{ #category : #accessing }
NSFormButton >> icon [ 	
	^ icon
]

{ #category : #accessing }
NSFormButton >> icon: aString [
	icon := aString
]

{ #category : #initializing }
NSFormButton >> initialize [ 
	title := ''.
	icon := ''.
	classes := ''.
	callback := [  ].
	onClick := [  ].
	type := 'button'.
	
]

{ #category : #accessing }
NSFormButton >> onClick [
	^ onClick
]

{ #category : #accessing }
NSFormButton >> onClick: anObject [
	onClick := anObject
]

{ #category : #rendering }
NSFormButton >> renderContentOn: html [
	html button 
		type: self type;
		class: 'btn waves-effect waves-light ', self classes;
		onClick: self onClick;
		with: [ 
			html icon
				class: 'fal ', self icon.
			html text: ' ' , self title.
		]. 
]

{ #category : #accessing }
NSFormButton >> title [ 	
	^ title
]

{ #category : #accessing }
NSFormButton >> title: aString [
	title := aString
]

{ #category : #accessing }
NSFormButton >> type [
	^ type
]

{ #category : #accessing }
NSFormButton >> type: anObject [
	type := anObject
]
