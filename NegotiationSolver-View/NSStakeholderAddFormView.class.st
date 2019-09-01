Class {
	#name : #NSStakeholderAddFormView,
	#superclass : #NSStakeholderFormView,
	#instVars : [
		'negotiation'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #actions }
NSStakeholderAddFormView >> addStakeholder [ 
	| stakeholder errors |
	errors := {  }.
	stakeholder := nil.
	stakeholder := NSStakeholder new
		name: (self name); 
		description: (self description); 
		type: (self type); 
		negotiationId: (self session at: #negotiation) id.
		
	stakeholder := NSStakeholder add: stakeholder.
	
	(stakeholder isNil) ifTrue: [ 
		errors := errors, 'There is already a stakeholder with this name.'.
		^ (NSReturnValue new errors: errors; item: nil).
	]
	ifFalse: [ 
		^ (NSReturnValue new item: stakeholder).
	].

]

{ #category : #accessing }
NSStakeholderAddFormView >> negotiation [
	^ negotiation
]

{ #category : #accessing }
NSStakeholderAddFormView >> negotiation: anObject [
	negotiation := anObject
]

{ #category : #rendering }
NSStakeholderAddFormView >> renderContentOn: html [
	html div
		style: 'width: 695px;';
		with: [  
			| options | 
			html render: (NSInputPanel new title: 'Stakeholder Toevoegen'; icon: 'fa-user-tie'; with: [
				(self message isNil) ifFalse: [ 
					html render: self message.
				].
				html render: (NSTextInput new 
					type: 'text';
					title: 'Naam'; 
					icon: 'fa-quote-left'; 
					callback: [ :value | self name: value. ]
				).
				html render: (NSLongTextInput new 
					title: 'Omschrijving'; 
					icon: 'fa-pen'; 
					rows: 3;
					default: '';
					callback: [ :value | self description: value. ]
				).
				html render: (NSLongTextInput new 
					title: 'Wenkend Perspectief'; 
					icon: 'fa-sun'; 
					rows: 4;
					default: '';
					callback: [ :value | self perspective: value. ]
				).
				options := {(NSOption new: 'decision-maker' text: 'Decision Maker') . (NSOption new: 'influencer' text: 'Influencer')}.
				html render: (NSSelect new  
					title: 'Type Stakeholder'; 
					icon: 'fa-user-tie'; 
					instruction: 'Select the type of this Stakeholder';
					options: options;
					selected: (options at: 1);
					callback: [ :option | self type: option value. ]
				).
				html render: (NSSliderInput new 
					title: 'Belang commitment'; 
					icon: 'fa-balance-scale-right'; 
					default: '50';
					callback: [ :value | self importance: value. ]
				).
				html render: (NSFormButton new 
					title: 'Stakeholder Toevoegen'; 
					icon: 'fa-plus'; 
					classes: 'float-right black text-white'; 
					onClick: ((html jQuery: 'body') load 
						serializeForm;
						html: [ :r |  
							| returnValue |
							returnValue := self addStakeholder.
							(returnValue errors isEmpty) ifTrue: [  
								self session view: 'stakeholders'.
								self session at: #stakeholder put: returnValue item.
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
