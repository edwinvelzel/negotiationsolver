"
Contains the general data and methods for user credential forms.
"
Class {
	#name : #NSUserCredentialsPage,
	#superclass : #NSPage,
	#instVars : [
		'email',
		'password'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSUserCredentialsPage >> email [
	^ email.
]

{ #category : #accessing }
NSUserCredentialsPage >> email: aString. [
	email := aString.
]

{ #category : #accessing }
NSUserCredentialsPage >> password [
	^ password.
]

{ #category : #accessing }
NSUserCredentialsPage >> password: aString [
	password := aString.
]
