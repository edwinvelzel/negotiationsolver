Class {
	#name : #NSBackButton,
	#superclass : #NSWidget,
	#instVars : [
		'classes',
		'callback',
		'title'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSBackButton >> callback [
	^ callback
]

{ #category : #accessing }
NSBackButton >> callback: anObject [
	callback := anObject
]

{ #category : #accessing }
NSBackButton >> classes [
	^ classes
]

{ #category : #accessing }
NSBackButton >> classes: anObject [
	classes := anObject
]

{ #category : #initializing }
NSBackButton >> initialize [
	super initialize.
	classes := ''.
	callback := [  ].
]

{ #category : #rendering }
NSBackButton >> renderContentOn: html [
	html div 
		class: 'action-btn page-left';
			with: [
				html anchor 
					class: 'btn-floating waves-effect waves-light ', self classes;
					style: 'box-shadow: none;top:-0.5rem;';
					callback: self callback;
					with: [  
						html icon
							class: 'fal fa-arrow-left';
							style: 'color: black;';
							title: self title.
					].
			].
	
]

{ #category : #accessing }
NSBackButton >> title [
	^ title
]

{ #category : #accessing }
NSBackButton >> title: anObject [
	title := anObject
]
