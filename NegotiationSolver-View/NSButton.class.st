Class {
	#name : #NSButton,
	#superclass : #NSWidget,
	#instVars : [
		'type',
		'title',
		'class',
		'attributes',
		'callback',
		'with'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSButton >> attributes [
	^ attributes
]

{ #category : #accessing }
NSButton >> attributes: anObject [
	attributes := anObject
]

{ #category : #accessing }
NSButton >> callback [
	^ callback
]

{ #category : #accessing }
NSButton >> callback: anObject [
	callback := anObject
]

{ #category : #accessing }
NSButton >> class [
	^ class
]

{ #category : #accessing }
NSButton >> class: anObject [
	class := anObject
]

{ #category : #initializing }
NSButton >> initialize [ 
	super initialize.
	type := 'button'.
	title := ''.
	class := 'btn'.
	attributes := #().
	callback := [  ].
	with := [  ].

]

{ #category : #rendering }
NSButton >> renderContentOn: html [
	| attrs |
"	attrs := WAHtmlAttributes new.
	self attributes do: [ :attribute |
		attrs at: (attribute at: 1) put: (attribute at: 2).
	].
"	html button
		type: self type;
		class: self class;
		callback: self callback;
"		attributes: attrs;"
		with: self with.
]

{ #category : #accessing }
NSButton >> title [
	^ title
]

{ #category : #accessing }
NSButton >> title: anObject [
	title := anObject
]

{ #category : #accessing }
NSButton >> type [
	^ type
]

{ #category : #accessing }
NSButton >> type: anObject [
	type := anObject
]

{ #category : #accessing }
NSButton >> with [
	^ with
]

{ #category : #accessing }
NSButton >> with: anObject [
	with := anObject
]
