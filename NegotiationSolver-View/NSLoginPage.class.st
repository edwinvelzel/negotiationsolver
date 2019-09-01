"
This is the Log In page of the NegotiationSolver website.
"
Class {
	#name : #NSLoginPage,
	#superclass : #NSUserCredentialsPage,
	#category : #'NegotiationSolver-View'
}

{ #category : #children }
NSLoginPage >> main [
	^ NSLoginView  new.
]

{ #category : #accessing }
NSLoginPage >> view [
	^ 'login'
]
