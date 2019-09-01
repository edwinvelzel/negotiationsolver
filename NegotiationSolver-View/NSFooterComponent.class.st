"
The standard Footer section.
"
Class {
	#name : #NSFooterComponent,
	#superclass : #NSPageComponent,
	#instVars : [
		'parent'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSFooterComponent >> renderContentOn: html [
	| steps margin top bulletSize |
	steps := OrderedCollection new.
	steps add: (Dictionary newFrom: { #view -> 'negotiation' . #title ->'Start' }).
	steps add: (Dictionary newFrom: { #view -> 'stakeholders' . #title -> 'Stakeholders' }).
	steps add: (Dictionary newFrom: { #view -> 'issues' . #title -> 'Onderwerpen' }).
	steps add: (Dictionary newFrom: { #view -> 'positions' . #title -> 'Posities' }).
	steps add: (Dictionary newFrom: { #view -> 'dashboard' . #title -> 'Dashboard' }).
	steps add: (Dictionary newFrom: { #view -> 'strategies' . #title -> 'Strategieën' }).
	margin := (50 / (steps size)) asFloat.
	top := 15.
	bulletSize := 20.
	
	html navigation 
		id: 'footer';
		class: 'footer';
		with: [  
			(self session has: #negotiation) ifTrue: [ 
				html div 
					style: 'position:absolute;top:', (top asString), 'px;height:1px;border:none;border-top:1px solid white;left:', (margin asString), '%;right:', (margin asString), '%;'.
				steps doWithIndex: [ :step :i |
					| active |
					active := ''.
					(self session view = (step at: #view)) ifTrue: [ active := 'active' ].
					html span 
						class: active;
						onClick: (( html jQuery: 'body') load
							html: [ :r | 
								self session view: (step at: #view).
								r render: NSRoot new.	
							]
						);
						with: [
						html div
							class: 'bullet ', active;
							style: 'top:', (top asString), 'px;height:', (bulletSize asString), 'px;width:', (bulletSize asString), 'px;left:', (margin + ((i - 1) * (2 * margin))) asFloat asString, '%'.
						html div 
							class: 'bullet-label ', active;
							style: 'top:', (bulletSize + 8) asString, 'px;width:', (2 * margin) asFloat asString, '%;left:', ((i - 1) * (2 * margin)) asFloat asString, '%';
							with: [ html text: (step at: #title) ].
					].
				].
			].
		].

]
