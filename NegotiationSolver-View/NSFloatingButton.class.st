Class {
	#name : #NSFloatingButton,
	#superclass : #NSWidget,
	#instVars : [
		'title',
		'icon',
		'classes',
		'callback'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSFloatingButton >> callback [ 
	^ callback
]

{ #category : #accessing }
NSFloatingButton >> callback: aBlock [
	callback := aBlock
]

{ #category : #accessing }
NSFloatingButton >> classes [ 
	^ classes
]

{ #category : #accessing }
NSFloatingButton >> classes: aString [
	classes := aString
]

{ #category : #accessing }
NSFloatingButton >> icon [ 
	^ icon
]

{ #category : #accessing }
NSFloatingButton >> icon: aString [
	icon := aString
]

{ #category : #initializing }
NSFloatingButton >> initialize [ 
	super initialize.
	title := ''.
	icon := ''.
	classes := ''.
	callback := [  ].
]

{ #category : #rendering }
NSFloatingButton >> renderContentOn: html [
	html div 
		class: 'action-btn page-right';
			with: [
				html anchor 
					class: 'btn-floating waves-effect waves-light btn-sm ', self classes;
					callback: self callback;
					with: [  
						html icon
							class: 'fal ', self icon;
							title: self title.
					].
			].
]

{ #category : #accessing }
NSFloatingButton >> title [ 
	^ title
]

{ #category : #accessing }
NSFloatingButton >> title: aString [
	title := aString
]
