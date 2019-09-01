"
A NSPageSection is a standard section in a NSPage. For instance the header, footer, main section of the sidebar.
"
Class {
	#name : #NSPageComponent,
	#superclass : #NSComponent,
	#instVars : [
		'children',
		'message'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSPageComponent >> message [
	^ message
]

{ #category : #accessing }
NSPageComponent >> message: anObject [
	message := anObject
]

{ #category : #rendering }
NSPageComponent >> renderContentOn: html [
	(self message isNil) ifFalse: [ html render: self message. ].
]
