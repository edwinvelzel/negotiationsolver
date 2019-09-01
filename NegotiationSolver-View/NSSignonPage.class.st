"
This is the Sign On page of the NegotiationSolver website.
"
Class {
	#name : #NSSignonPage,
	#superclass : #NSUserCredentialsPage,
	#instVars : [
		'name',
		'passwordVerification'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #children }
NSSignonPage >> main [
	^ NSSignonView new.
]

{ #category : #accessing }
NSSignonPage >> name [
	^ name.
]

{ #category : #accessing }
NSSignonPage >> name: aString [
	name := aString.
]

{ #category : #accessing }
NSSignonPage >> passwordVerification [
	^ passwordVerification.
]

{ #category : #accessing }
NSSignonPage >> passwordVerification: aString [
	passwordVerification := aString.
]

{ #category : #accessing }
NSSignonPage >> view [
	^ 'signon'
]
