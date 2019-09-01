"
The main section for the Negotiation Page.
"
Class {
	#name : #NSNegotiationItemView,
	#superclass : #NSNegotiationView,
	#instVars : [
		'subview',
		'negotiation',
		'stakeholdersSubSection',
		'interestsSubSection',
		'issuesSubSection',
		'positionsSubSection'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #actions }
NSNegotiationItemView >> back [ 
	self show: NSNegotiationListView new.
]

{ #category : #children }
NSNegotiationItemView >> children [
	^ { stakeholdersSubSection }
]

{ #category : #actions }
NSNegotiationItemView >> editNegotiation [
	self editNegotiation: nil.
]

{ #category : #actions }
NSNegotiationItemView >> editNegotiation: aMessage [
	| returnValue |
	returnValue := self call: (NSNegotiationEditFormView new negotiation: self negotiation; message: aMessage).
	(returnValue isNil)
		ifTrue: [ self show: (NSNegotiationItemView new negotiation: (self negotiation)) ]
		ifFalse: [ 
			(returnValue item isNil) "Item deleted"
				ifTrue: [ self show: NSNegotiationListView new. ]
				ifFalse: [ 
					(returnValue errors isEmpty) "Item changed and saved without errors"
						ifTrue: [ self show: (NSNegotiationItemView new negotiation: returnValue item). ]
						ifFalse: [ self editNegotiation: (NSAlert new text: returnValue errorMessage, ' Please try again'; classes: 'alert-danger'). ]
				].
		].


]

{ #category : #initialization }
NSNegotiationItemView >> initialize [ 
	subview := 'stakeholders'.
	stakeholdersSubSection := NSStakeholderListView new negotiation: self negotiation.
]

{ #category : #accessing }
NSNegotiationItemView >> interestsSubSection [
	^ interestsSubSection
]

{ #category : #accessing }
NSNegotiationItemView >> interestsSubSection: anObject [
	interestsSubSection := anObject
]

{ #category : #accessing }
NSNegotiationItemView >> issuesSubSection [
	^ issuesSubSection
]

{ #category : #accessing }
NSNegotiationItemView >> issuesSubSection: anObject [
	issuesSubSection := anObject
]

{ #category : #accessing }
NSNegotiationItemView >> negotiation [
	^ negotiation
]

{ #category : #accessing }
NSNegotiationItemView >> negotiation: anObject [
	negotiation := anObject
]

{ #category : #accessing }
NSNegotiationItemView >> positionsSubSection [
	^ positionsSubSection
]

{ #category : #accessing }
NSNegotiationItemView >> positionsSubSection: anObject [
	positionsSubSection := anObject
]

{ #category : #rendering }
NSNegotiationItemView >> renderContentOn: html [
	| tabs |
	super renderContentOn: html.
	self stakeholdersSubSection negotiation: self negotiation.
	html div
		class: 'main'; 
		with: [
			(self session user = self negotiation owner) ifTrue: [
				html render: (NSFloatingButton new 
					title: 'Edit Negotiation';
					icon: 'fa-pen';
					classes: 'red page-right';
					callback: [ self editNegotiation. ]
				).
			].
			html render: (NSBackButton new 
				title: 'Back to Negotiations overview';
				callback: [ self back. ]
			).
			html heading 
				level: 4;
				with: [ html text: self negotiation name. ].
			html paragraph 
				with: [ html text: self negotiation description. ].
			tabs := OrderedCollection new.
			tabs add: (NSTab new 
				id: 'stakeholders'; 
				title: 'Stakeholders'; 
				selected: self subview = 'stakeholders';
				callback: [ self subview: 'stakeholders' ];
				content: [ html render: self stakeholdersSubSection. ]
			).
			tabs add: (NSTab new 
				id: 'interests'; 
				title: 'Interests'; 
				selected: self subview = 'interests'; 
				callback: [ self subview: 'interests' ];
				content: [  ]
			).
			tabs add: (NSTab new 
				id: 'negotiation-issues'; 
				title: 'Issues'; 
				selected: self subview = 'negotiation-issues'; 
				callback: [ self subview: 'negotiation-issues' ];
				content: [  ]
			).
			tabs add: (NSTab new 
				id: 'stakeholder-positions'; 
				title: 'Positions'; 
				selected: self subview = 'stakeholder-positions'; 
				callback: [ self subview: 'stakeholder-positions' ];
				content: [  ]
			).
			html render: (NSTabList new 
				id: 'negotiaton-main-tabs'; 
				tabs: tabs).
		].

]

{ #category : #accessing }
NSNegotiationItemView >> stakeholdersSubSection [
	^ stakeholdersSubSection
]

{ #category : #accessing }
NSNegotiationItemView >> stakeholdersSubSection: anObject [
	stakeholdersSubSection := anObject
]

{ #category : #accessing }
NSNegotiationItemView >> subview [
	^ subview 
]

{ #category : #accessing }
NSNegotiationItemView >> subview: aSubview [
	subview := aSubview.
]
