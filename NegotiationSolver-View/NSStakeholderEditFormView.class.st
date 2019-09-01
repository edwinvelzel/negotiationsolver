Class {
	#name : #NSStakeholderEditFormView,
	#superclass : #NSStakeholderFormView,
	#instVars : [
		'stakeholder'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #actions }
NSStakeholderEditFormView >> removeStakeholder [
	| oldStakeholder |
	oldStakeholder := self session at: #stakeholder.
"	(self confirm: 'Do you want to delete this Stakeholder?') 
	ifTrue: [
"		NSStakeholder remove: oldStakeholder.
		^ NSReturnValue new.
"	]
	ifFalse: [ self answer: nil ].
"
]

{ #category : #rendering }
NSStakeholderEditFormView >> renderContentOn: html [
	stakeholder := self session at: #stakeholder.
	html div
		style: 'width:750px;';
		with: [  
			| options | 
			html render: (NSInputPanel new title: 'Edit Stakeholder'; icon: 'fa-user-tie'; with: [
				(self message isNil) ifFalse: [ 
					html render: self message.
				].
				html render: (NSTextInput new 
					type: 'text';
					title: 'Name'; 
					icon: 'fa-quote-left'; 
					default: self stakeholder name;
					callback: [ :value | self name: value. ]
				).
				html render: (NSLongTextInput new 
					title: 'Description'; 
					icon: 'fa-pen'; 
					rows: 2;
					default: self stakeholder description;
					callback: [ :value | self description: value. ]
				).
				html render: (NSLongTextInput new 
					title: 'Wenkend Perspectief'; 
					icon: 'fa-sun'; 
					rows: 2;
					default: self stakeholder perspective;
					callback: [ :value | self perspective: value. ]
				).
				options := {(NSOption new: 'decision-maker' text: 'Decision Maker') . (NSOption new: 'influencer' text: 'Influencer')}.
				html render: (NSSelect new  
					title: 'Negotiation Type'; 
					icon: 'fa-user-tie'; 
					instruction: 'Select the type of this Stakeholder';
					options: options;
					selected: self stakeholder type;
					callback: [ :option | self type: option value. ]
				).
				html render: (NSSliderInput new 
					title: 'Belang commitment'; 
					icon: 'fa-balance-scale-right'; 
					default: self stakeholder importance;
					callback: [ :value | self importance: value. ]
				).
				html render: (NSFormButton new 
					title: 'Save Stakeholder'; 
					icon: 'fa-save'; 
					classes: 'float-right black text-white'; 
					onClick: ((html jQuery: 'body') load 
						serializeForm;
						html: [ :r |  
							| returnValue |
							returnValue := self saveStakeholder.
							(returnValue errors isEmpty) ifTrue: [  
								self session view: 'stakeholders'.
								self session at: #stakeholder put: returnValue item.
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
							returnValue := self removeStakeholder.
							(returnValue errors isEmpty) ifTrue: [  
								self session view: 'stakeholders'.
								self session remove: #stakeholder.
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
							self session view: 'stakeholders'.
							r render: NSRoot new.
						]
					)
				).
			]).
		].
]

{ #category : #actions }
NSStakeholderEditFormView >> saveStakeholder [
	| oldStakeholder newStakeholder result errors |
	errors := {  }.
	oldStakeholder := self session at: #stakeholder.
	newStakeholder := NSStakeholder new 
		id: oldStakeholder id;
		negotiationId: oldStakeholder negotiationId;
		name: (self name); 
		description: (self description);
		perspective: (self perspective);
		importance: (self importance);
		type: (self type).
	result := NSStakeholder update: oldStakeholder to: newStakeholder.
	(result isNil) ifTrue: [ 
		errors := errors, 'There is already a stakeholder with this name.'.
		^ (NSReturnValue new errors: errors; item: oldStakeholder).
	]
	ifFalse: [ 
		^ (NSReturnValue new item: newStakeholder ).
	].

]

{ #category : #accessing }
NSStakeholderEditFormView >> stakeholder [
	^ stakeholder
]

{ #category : #accessing }
NSStakeholderEditFormView >> stakeholder: anObject [
	stakeholder := anObject
]
