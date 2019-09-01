"
On this page a new Negotiation can be added.
"
Class {
	#name : #NSNegotiationAddPage,
	#superclass : #NSNegotiationFormPage,
	#category : #'NegotiationSolver-View'
}

{ #category : #children }
NSNegotiationAddPage >> main [
	^ NSNegotiationAddFormView new parent: self.
]

{ #category : #accessing }
NSNegotiationAddPage >> view [
	^ 'negotiation-add'
]
