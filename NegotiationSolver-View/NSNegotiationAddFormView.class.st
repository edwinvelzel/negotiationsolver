"
This Section contains the form to edit or delete a Negotiation.
"
Class {
	#name : #NSNegotiationAddFormView,
	#superclass : #NSNegotiationFormView,
	#category : #'NegotiationSolver-View'
}

{ #category : #actions }
NSNegotiationAddFormView >> addNegotiation [
	| negotiation errors |
	errors := {  }.
	negotiation := NSNegotiation add: (self name) description: (self description) type: (self type) owner: self session user.
	(negotiation isNil) ifTrue: [ 
		errors := errors, 'There is already a negotiation with this name.'.
		^ (NSReturnValue new errors: errors; item: nil).
	]
	ifFalse: [ 
		^ (NSReturnValue new item: negotiation).
	].

]

{ #category : #rendering }
NSNegotiationAddFormView >> renderContentOn: html [
	super renderContentOn: html.
	html div
		style: 'width:600px;';
		with: [  
			| options | 
			html render: (NSInputPanel new title: 'Add Negotiation'; icon: 'fa-handshake'; with: [
				html render: (NSTextInput new 
					type: 'text';
					title: 'Name'; 
					icon: 'fa-quote-left'; 
					callback: [ :value | self name: value. ]
				).
				html render: (NSLongTextInput new 
					title: 'Description'; 
					icon: 'fa-pen'; 
					rows: 3;
					default: '';
					callback: [ :value | self description: value. ]
				).
				options := {(NSOption new: 'single-sided' text: 'Single Sided Negotiation') . (NSOption new: 'multi-sided' text: 'Multi Sided Negotiation')}.
				html render: (NSSelect new  
					title: 'Negotiation Type'; 
					icon: 'fa-handshake'; 
					instruction: 'Select the type of this Negotiation';
					options: options;
					selected: (options at: 1);
					callback: [ :option | self type: option value. ]
				).
				html render: (NSFormButton new 
					title: 'Add Negotiation'; 
					icon: 'fa-plus'; 
					classes: 'float-right black text-white'; 
					onClick: ((html jQuery: 'body') load 
						serializeForm;
						html: [ :r |  
							| returnValue |
							returnValue := self addNegotiation.
							(returnValue errors isEmpty) ifTrue: [  
								self session view: 'negotiation'.
								self session at: #negotiation put: returnValue item.
							].
							r render: NSRoot new.
						]
					)
				).
				html render: (NSFormButton new
					title: 'Cancel'; 
					icon: 'fa-window-close'; 
					classes: 'float-right btn-light'; 
					onClick: ((html jQuery: 'body') load 
						serializeForm;
						html: [ :r |  
							self session view: 'home'.
							r render: NSRoot new.
						]
					)
				).
			]).
		].
]
