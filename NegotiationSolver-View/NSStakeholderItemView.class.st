Class {
	#name : #NSStakeholderItemView,
	#superclass : #NSStakeholderView,
	#instVars : [
		'stakeholder',
		'negotiation'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #actions }
NSStakeholderItemView >> back [ 
	self show: (NSStakeholderListView new negotiation: self negotiation).
]

{ #category : #actions }
NSStakeholderItemView >> editStakeholder [
	self editStakeholder: nil.
]

{ #category : #actions }
NSStakeholderItemView >> editStakeholder: aMessage [
	| returnValue |
	returnValue := self call: (NSStakeholderEditFormView new stakeholder: self stakeholder; message: aMessage).
	(returnValue isNil)
		ifTrue: [ self show: (NSStakeholderItemView new stakeholder: (self stakeholder); negotiation: (self negotiation)) ]
		ifFalse: [ 
			(returnValue item isNil)
				ifTrue: [ self show: (NSStakeholderListView new negotiation: self negotiation). ]
				ifFalse: [
					(returnValue errors isEmpty)
						ifTrue: [ self show: (NSStakeholderItemView new stakeholder: (returnValue item); negotiation: self negotiation) ]
						ifFalse: [ self editStakeholder: (NSAlert new text: returnValue errorMessage, ' Please try again.'; classes: 'alert-danger'). ]
				].
		].

]

{ #category : #accessing }
NSStakeholderItemView >> negotiation [
	^ negotiation
]

{ #category : #accessing }
NSStakeholderItemView >> negotiation: anObject [
	negotiation := anObject
]

{ #category : #rendering }
NSStakeholderItemView >> renderContentOn: html [
	super renderContentOn: html.
	html div
		with: [
			(self session user = self negotiation owner) ifTrue: [
				html render: (NSFloatingButton new 
					title: 'Edit Stakeholder';
					icon: 'fa-pen';
					classes: 'red float-right';
					callback: [ self editStakeholder. ]
				).
			].
			html render: (NSBackButton new 
				title: 'Back to stakeholders list';
				callback: [ self back. ]
			).
			html heading 
				level: 4;
				with: [ html text: self stakeholder name. ].
			html paragraph 
				with: [ html text: self stakeholder description. ].
		].

]

{ #category : #accessing }
NSStakeholderItemView >> stakeholder [
	^ stakeholder
]

{ #category : #accessing }
NSStakeholderItemView >> stakeholder: anObject [
	stakeholder := anObject
]
