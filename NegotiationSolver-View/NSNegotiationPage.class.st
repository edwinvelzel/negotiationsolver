"
A page which displays a Negotiation.
"
Class {
	#name : #NSNegotiationPage,
	#superclass : #NSPage,
	#instVars : [
		'negotiation'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #children }
NSNegotiationPage >> main [
	^ NSNegotiationItemView new parent: self; negotiation: self negotiation.
]

{ #category : #accessing }
NSNegotiationPage >> negotiation [
	^ negotiation
]

{ #category : #accessing }
NSNegotiationPage >> negotiation: aNegotiation [
	negotiation := aNegotiation.
]

{ #category : #accessing }
NSNegotiationPage >> view [
	^ 'negotiation'
]
