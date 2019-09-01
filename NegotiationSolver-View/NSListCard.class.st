Class {
	#name : #NSListCard,
	#superclass : #NSWidget,
	#instVars : [
		'with'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSListCard >> renderContentOn: html [
	html div
		class: 'card square scrollbar-default ';
		with: [  
			html div
				class: 'card-body';
				with: [  
					html div
						class: 'list-group list-group-flush';
						with: self with.
				].
		].

]

{ #category : #accessing }
NSListCard >> with [
	^ with
]

{ #category : #accessing }
NSListCard >> with: anObject [
	with := anObject
]
