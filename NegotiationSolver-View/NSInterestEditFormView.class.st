Class {
	#name : #NSInterestEditFormView,
	#superclass : #NSInterestFormView,
	#instVars : [
		'interest'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSInterestEditFormView >> interest [
	^ interest
]

{ #category : #accessing }
NSInterestEditFormView >> interest: anObject [
	interest := anObject
]

{ #category : #rendering }
NSInterestEditFormView >> renderContentOn: html [
	html div
		style: 'width: 695px;';
		with: [  
			html render: (NSInputPanel new title: 'Belang Wijzigen'; icon: 'fa-exclamation-circle'; with: [
				(self message isNil) ifFalse: [ 
					html render: self message.
				].
				html render: (NSTextInput new 
					type: 'text';
					title: 'Naam'; 
					icon: 'fa-quote-left'; 
					default: (self interest name);
					callback: [ :value | self name: value. ]
				).
				html render: (NSLongTextInput new 
					title: 'Omschrijving'; 
					icon: 'fa-pen'; 
					rows: 3;
					default: (self interest description);
					callback: [ :value | self description: value. ]
				).
				html render: (NSSliderInput new 
					title: 'Weging'; 
					icon: 'fa-balance-scale-right'; 
					default: (self interest importance);
					callback: [ :value | self importance: value. ]
				).
				html render: (NSFormButton new 
					title: 'Belang Bewaren'; 
					icon: 'fa-save'; 
					classes: 'float-right black text-white'; 
					onClick: ((html jQuery: 'body') load 
						serializeForm;
						html: [ :r |  
							| returnValue |
							returnValue := self saveInterest.
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
							r render: NSRoot new.
						]
					)
				).
			]).
		].
]

{ #category : #actions }
NSInterestEditFormView >> saveInterest [
	| oldInterest newInterest result errors |
	errors := {  }.
	oldInterest := self interest.
	newInterest := NSInterest new 
		id: oldInterest id;
		name: (self name); 
		description: (self description);
		importance: (self importance); 
		stakeholderId: oldInterest stakeholder id.
	result := NSInterest update: oldInterest to: newInterest.
	(result isNil) ifTrue: [ 
		errors := errors, 'There is already an interest with this name.'.
		^ (NSReturnValue new errors: errors; item: oldInterest ).
	]
	ifFalse: [ 
		^ (NSReturnValue new item: newInterest).
	].

]
