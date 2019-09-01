Class {
	#name : #NSInterestAddFormView,
	#superclass : #NSInterestFormView,
	#instVars : [
		'stakeholder'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #actions }
NSInterestAddFormView >> addInterest [
	| interest errors |
	errors := {  }.
	interest := nil.
	interest := NSInterest new
		name: (self name); 
		description: (self description); 
		importance: (self importance);
		stakeholderId: (self stakeholder) id.
		
	interest := NSInterest add: interest.
	
	(interest isNil) ifTrue: [ 
		errors := errors, 'There is already an interest with this name.'.
		^ (NSReturnValue new errors: errors; item: nil).
	]
	ifFalse: [ 
		^ (NSReturnValue new item: interest).
	].

]

{ #category : #rendering }
NSInterestAddFormView >> renderContentOn: html [
	html div
		style: 'width: 695px;';
		with: [  
			html render: (NSInputPanel new title: 'Belang Toevoegen'; icon: 'fa-exclamation-circle'; with: [
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
				html render: (NSSliderInput new 
					title: 'Weging'; 
					icon: 'fa-balance-scale-right'; 
					default: '50';
					callback: [ :value | self importance: value. ]
				).
				html render: (NSFormButton new 
					title: 'Belang Toevoegen'; 
					icon: 'fa-plus'; 
					classes: 'float-right black text-white'; 
					onClick: ((html jQuery: 'body') load 
						serializeForm;
						html: [ :r |  
							| returnValue |
							returnValue := self addInterest.
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

{ #category : #accessing }
NSInterestAddFormView >> stakeholder [
	^ stakeholder
]

{ #category : #accessing }
NSInterestAddFormView >> stakeholder: anObject [
	stakeholder := anObject
]
