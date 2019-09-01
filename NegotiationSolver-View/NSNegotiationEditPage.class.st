"
On this page a Negotiation can be edited or deleted.
"
Class {
	#name : #NSNegotiationEditPage,
	#superclass : #NSNegotiationFormPage,
	#instVars : [
		'negotiation'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #children }
NSNegotiationEditPage >> main [
	^ NSNegotiationEditFormView new parent: self.
]

{ #category : #accessing }
NSNegotiationEditPage >> negotiation [
	^ negotiation 
]

{ #category : #accessing }
NSNegotiationEditPage >> negotiation: aNegotiation [
	negotiation := aNegotiation.
]

{ #category : #accessing }
NSNegotiationEditPage >> view [
	^ 'negotiation-add'
]
