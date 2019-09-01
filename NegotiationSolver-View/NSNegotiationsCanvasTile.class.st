Class {
	#name : #NSNegotiationsCanvasTile,
	#superclass : #NSCanvasTileView,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSNegotiationsCanvasTile >> renderContentOn: html [
	| iconLeft titleLeft iconRight titleRight active |
	(self session has: #user) ifTrue: [ 
		self session user negotiations do: [ :negotiation |
			active := ''.
			(self session has: #negotiation) ifTrue: [ 
				((self session at: #negotiation) = negotiation) ifTrue: [ active := 'active' ]
			].
			iconLeft := titleLeft := iconRight := titleRight := ''.
			(negotiation type = 'single-sided') ifTrue: [ 
				iconLeft := 'fa-crosshairs'.
				titleLeft := 'Single sided negotiation'.
			].
			(negotiation type = 'multi-sided') ifTrue: [ 
				iconLeft := 'fa-compress-arrows-alt'.
				titleLeft := 'Multi sided negotiation'.
			].
			(negotiation owner = self session user) ifTrue: [ 
				iconRight := 'fa-user'.
				titleRight := 'You are owner of this negotiation.'.
			].
			html div 
				class: 'canvas-list-item ', active;
				onClick: (( html jQuery: 'body') load
					html: [ :r | 
						self session at: #negotiation put: negotiation.
						self session view: 'negotiation'.
						r render: NSRoot new. 
					]
				);
				with: [
					html anchor 
						with: [  
							html icon 
								class: 'left fal ', iconLeft;
								title: titleLeft.
							html text: (negotiation name).
							html icon 
								class: 'right fal ', iconRight;
								title: titleRight.
						].
				].
			].
		html anchor 
			class: 'canvas-title-button';
			title: 'Onderhandeling toevoegen';
			onClick: (( html jQuery: 'body') load
				html: [ :r | 
					self session remove: #negotiation.
					r render: (NSRoot new modal: NSNegotiationAddFormView new).
				]
			);
			with: [  
				html icon 
					class: 'fal fa-plus'.
			].
	].

]
