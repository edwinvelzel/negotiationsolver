"
This Section contains the form to edit or delete a Negotiation.
"
Class {
	#name : #NSNegotiationEditFormView,
	#superclass : #NSNegotiationFormView,
	#instVars : [
		'negotiation'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #actions }
NSNegotiationEditFormView >> removeNegotiation [
	| oldNegotiation |
	oldNegotiation := self session at: #negotiation.
"	(self confirm: 'Do you want to delete this Negotiation?') ifTrue: ["
		NSNegotiation remove: oldNegotiation.
		^ NSReturnValue new.
"	]"
"	ifFalse: [ ^ nil ].
"

]

{ #category : #rendering }
NSNegotiationEditFormView >> renderContentOn: html [
	negotiation := self session at: #negotiation.
	super renderContentOn: html.
	html div
		style: 'width:690px;';
		with: [  
			| options | 
			html render: (NSInputPanel new title: 'Edit Negotiation'; icon: 'fa-handshake'; with: [
				html render: (NSTextInput new  
					type: 'text';
					title: 'Name'; 
					icon: 'fa-quote-left'; 
					default:  negotiation name;
					callback: [ :value | self name: value. ]
				).
				html render: (NSLongTextInput new 
					title: 'Description'; 
					icon: 'fa-pen'; 
					rows: 3;
					default: negotiation description;
					callback: [ :value | self description: value. ]
				).
				options := {(NSOption new: 'single-sided' text: 'Single Sided Negotiation') . (NSOption new: 'multi-sided' text: 'Multi Sided Negotiation')}.
				html render: (NSSelect new  
					title: 'Negotiation Type'; 
					icon: 'fa-handshake'; 
					instruction: 'Select the type of this Negotiation';
					options: options;
					selected: (options detect: [ :option | option value = negotiation type ] );
					callback: [ :option | self type: option value. ]
				).
				html render: (NSFormButton new 
					title: 'Save Negotiation'; 
					icon: 'fa-save'; 
					classes: 'float-right black text-white'; 
					onClick: ((html jQuery: 'body') load 
						serializeForm;
						html: [ :r |  
							| returnValue |
							returnValue := self saveNegotiation.
							(returnValue errors isEmpty) ifTrue: [  
								self session view: 'negotiation'.
								self session at: #negotiation put: returnValue item.
							].
							r render: NSRoot new.
						]
					)
				).
				html render: (NSFormButton new 
					title: 'Delete'; 
					icon: 'fa-trash-alt'; 
					classes: 'float-right btn-danger'; 
					onClick: ((html jQuery: 'body') load 
						serializeForm;
						html: [ :r |  
							| returnValue |
							returnValue := self removeNegotiation.
							(returnValue errors isEmpty) ifTrue: [  
								self session view: 'home'.
								self session remove: #negotiation.
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
							self session view: 'negotiation'.
							r render: NSRoot new.
						]
					)
				).
			]).
		].
]

{ #category : #actions }
NSNegotiationEditFormView >> saveNegotiation [
	| oldNegotiation newNegotiation result errors |
	errors := {  }.
	oldNegotiation := self session at: #negotiation.
	newNegotiation := NSNegotiation new 
		id: oldNegotiation id;
		name: (self name); 
		description: (self description);
		type: (self type); 
		ownerId: self session user id.
	result := NSNegotiation update: oldNegotiation to: newNegotiation.
	(result isNil) ifTrue: [ 
		errors := errors, 'There is already a negotiation with this name.'.
		^ (NSReturnValue new errors: errors; item: oldNegotiation ).
	]
	ifFalse: [ 
		^ (NSReturnValue new item: newNegotiation).
	].

]
