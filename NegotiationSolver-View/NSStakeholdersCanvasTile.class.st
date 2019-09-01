Class {
	#name : #NSStakeholdersCanvasTile,
	#superclass : #NSCanvasTileView,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSStakeholdersCanvasTile >> renderContentOn: html [
	| negotiation iconLeft titleLeft active |
	(self session has: #negotiation) ifTrue: [ 
		negotiation := self session at: #negotiation.
		negotiation stakeholders do: [ :stakeholder |
			active := ''.
			(self session has: #stakeholder) ifTrue: [ 
				((self session at: #stakeholder) = stakeholder) ifTrue: [ active := 'active' ]
			].
			iconLeft := titleLeft := ''.
			(stakeholder type = 'decision-maker') ifTrue: [ 
				iconLeft := 'fa-handshake'.
				titleLeft := '(Mede)beslisser'.
			].
			(stakeholder type = 'influencer') ifTrue: [ 
				iconLeft := 'fa-bullhorn'.
				titleLeft := 'Beïnvloeder'.
			].
			html div 
				class: 'canvas-list-item ', active;
				onClick: (( html jQuery: 'body') load
					html: [ :r | 
						self session at: #stakeholder put: stakeholder.
						r render: NSRoot new. 
					]
				);
				with: [
					html anchor 
						with: [  
							html icon 
								class: 'left fal ', iconLeft;
								title: titleLeft.
							html text: (stakeholder name).
							html span 
								class: 'badge badge-pill badge-light';
								style: 'position: absolute;right:0;';
								with: (stakeholder importance).
						].
				].
			].
		html anchor 
			class: 'canvas-title-button';
			title: 'Stakeholder toevoegen';
			onClick: (( html jQuery: 'body') load
				html: [ :r | 
					self session remove: #stakeholder.
					r render: (NSRoot new modal: NSStakeholderAddFormView new).
				]
			);
			with: [  
				html icon 
					class: 'fal fa-plus'.
			].
	].

]
