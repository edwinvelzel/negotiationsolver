Class {
	#name : #NSStakeholderListView,
	#superclass : #NSStakeholderView,
	#instVars : [
		'negotiation'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #actions }
NSStakeholderListView >> addStakeholder [
	self addStakeholder: nil.
]

{ #category : #actions }
NSStakeholderListView >> addStakeholder: aMessage [
	| returnValue |
	returnValue := self call: (NSStakeholderAddFormView new negotiation: self negotiation; message: aMessage).
	(returnValue isNil) "Cancel button"
		ifTrue: [ self show: (NSStakeholderListView new negotiation: self negotiation). ]
		ifFalse: [ 
			(returnValue item isNil) "Item not added"
				ifTrue: [ self addStakeholder: (NSAlert new text: returnValue errorMessage, ' Please try again.'; classes: 'alert-danger'). ]
				ifFalse: [ self show: (self class new negotiation: self negotiation). ].
		].
]

{ #category : #accessing }
NSStakeholderListView >> negotiation [
	^ negotiation
]

{ #category : #accessing }
NSStakeholderListView >> negotiation: aNegotiation [
	negotiation := aNegotiation
]

{ #category : #rendering }
NSStakeholderListView >> renderContentOn: html [
	super renderContentOn: html.
	html heading 
		level: 4;
		with: [ html text: 'Stakeholders list' ].
	html render: (NSListCard new with: [
		negotiation stakeholders do: [ :stakeholder | 
			| iconLeft titleLeft |
			iconLeft := titleLeft := ''.
			(stakeholder type = 'decision-maker') ifTrue: [ 
				iconLeft := 'fa-handshake'.
				titleLeft := 'Decision Maker'.
			].
			(stakeholder type = 'influencer') ifTrue: [ 
				iconLeft := 'fa-bullhorn'.
				titleLeft := 'Influencer'.
			].
			html render: (NSListItemClickable new
				title: (stakeholder name);
				iconLeft: iconLeft;
				iconTitleLeft: titleLeft; 
				iconRight: '';
				iconTitleRight: ''; 
				callbackBlock: [ self selectStakeholder: stakeholder. ];
				with: [ 
					html span 
						class: 'badge badge-pill badge-default float-right';
						with: [ html text: stakeholder importance ]	.
				]
			).
		].
		html render: (NSFloatingButton new 
			title: 'Add Stakeholder';
			icon: 'fa-plus'; 
			classes: 'red float-right'; 
			callback: [ 
				self addStakeholder. 
			]
		).
	]).

]

{ #category : #actions }
NSStakeholderListView >> selectStakeholder: aStakeholder [
	self call: (NSStakeholderItemView new stakeholder: aStakeholder; negotiation: self negotiation).
]
