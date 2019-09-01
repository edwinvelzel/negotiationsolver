Class {
	#name : #NSUserCredentialsView,
	#superclass : #NSPageComponent,
	#instVars : [
		'email',
		'password'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSUserCredentialsView >> email [
	^ email
]

{ #category : #accessing }
NSUserCredentialsView >> email: anObject [
	email := anObject
]

{ #category : #accessing }
NSUserCredentialsView >> password [
	^ password
]

{ #category : #accessing }
NSUserCredentialsView >> password: anObject [
	password := anObject
]
