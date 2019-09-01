Class {
	#name : #NSStepper,
	#superclass : #NSWidget,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSStepper >> renderContentOn: html with: aBlock [
	html unorderedList 
		class: 'stepper';
		with: aBlock.
]
