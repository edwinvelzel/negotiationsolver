"
The Main section of the Home Page.
"
Class {
	#name : #NSNegotiationListView,
	#superclass : #NSNegotiationView,
	#category : #'NegotiationSolver-View'
}

{ #category : #actions }
NSNegotiationListView >> addNegotiation [
	self addNegotiation: nil.
]

{ #category : #actions }
NSNegotiationListView >> addNegotiation: aMessage [
	| returnValue |
	returnValue := (self call: (NSNegotiationAddFormView new message: aMessage)).
	(returnValue isNil)
		ifTrue: [ self show: (NSNegotiationListView new) ]
		ifFalse: [ 
			(returnValue item isNil)
				ifTrue: [  
					self addNegotiation: (NSAlert new text: returnValue errors, ' Please try again.'; classes: 'alert-danger').
				]
				ifFalse: [ 
					self show: self class new.
				]
		].

]

{ #category : #rendering }
NSNegotiationListView >> renderContentOn: html [
	| user iconLeft titleLeft iconRight titleRight |
	super renderContentOn: html.
	user := self session user.
	html div
		class: 'main'; 
		with: [
			(user isNil) ifFalse: [
				html heading 
					level: 4;
					with: [ html text: 'My Negotiations' ].
				html render: (NSListCard new with: [
					user negotiations do: [ :negotiation | 
						iconLeft := titleLeft := iconRight := titleRight := ''.
						(negotiation type = 'single-sided') ifTrue: [ 
							iconLeft := 'fa-crosshairs'.
							titleLeft := 'Single sided negotiation'.
						].
						(negotiation type = 'multi-sided') ifTrue: [ 
							iconLeft := 'fa-compress-arrows-alt'.
							titleLeft := 'Multi sided negotiation'.
						].
						(negotiation owner = user) ifTrue: [ 
							iconRight := 'fa-user'.
							titleRight := 'You are owner of this negotiation.'.
						].
						html render: (NSListItemClickable new 
							title: (negotiation name); 
							iconLeft: iconLeft; 
							iconTitleLeft: titleLeft; 
							iconRight: iconRight; 
							iconTitleRight: titleRight; 
							callbackBlock: [ self selectNegotiation: negotiation. ]
						).
					].			
					html render: (NSFloatingButton new 
						title: 'Add Negotiation'; 
						icon: 'fa-plus'; 
						classes: 'red float-right';
						callback: [ self addNegotiation. ]).
					]).
		].
	].

]

{ #category : #actions }
NSNegotiationListView >> selectNegotiation: aNegotiation [
	self show: (NSNegotiationItemView new negotiation: aNegotiation).
]
