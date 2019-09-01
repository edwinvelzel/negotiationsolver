Class {
	#name : #NSStakeholdersCanvasView,
	#superclass : #NSCanvasView,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSStakeholdersCanvasView >> renderContentOn: html [
	| negotiation stakeholder |
	negotiation := self session at: #negotiation.
	stakeholder := self session at: #stakeholder.
	html div
		id: 'canvas'; 
		class: 'canvas';
		with: [ 
			html div 
				id: 'negotiation';
				class: 'canvas-tile';
				style: 'left: 0; top: 0; height: 11%; width: 100%;border-bottom-width:1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Onderhandeling' ].
					html div 
						class: 'canvas-tile-content';
						with: [ 
							html div 
								class: 'canvas-tile-content-heading';
								with: [ html text: negotiation name ].
						].
				].
			html div 
				id: 'stakeholders';
				class: 'canvas-tile';
				style: 'left: 0; top: 11%; height: 89%; width: 25%; border-right-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Stakeholders' ].
					html div 
						class: 'canvas-tile-content';
						with: [ html render: NSStakeholdersCanvasTile new. ]
				].
			html div 
				id: 'stakeholder';
				class: 'canvas-tile';
				style: 'left: 25%; top: 11%; height: 15%; width: 75%; border-bottom-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Stakeholder' ].
					(stakeholder isNil) ifFalse: [ 
						html div 
							class: 'canvas-tile-content d-flex flex-row';
							with: [ 
								html div 
									class: 'canvas-tile-content-heading d-inline-flex'; 
									with: [ html text: stakeholder name ].
								html div 
									class: 'canvas-tile-content-body d-inline-flex'; 
									with: [ html text: stakeholder description ].
							].
						html anchor 
							class: 'canvas-title-button';
							title: 'Stakeholder wijzigen';
							onClick: (( html jQuery: 'body') load
								html: [ :r | 
									r render: (NSRoot new modal: NSStakeholderEditFormView new).
								]
							);
							with: [  
								html icon 
									class: 'fal fa-pen'.
							].
					].
				].
			html div 
				id: 'wenkend-perspectief';
				class: 'canvas-tile';
				style: 'left: 25%; top: 26%; height: 15%; width: 75%; border-bottom-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Wenkend perspectief' ].
					(stakeholder isNil) ifFalse: [ 
						html div 
							class: 'canvas-tile-content';
							with: [ 
								html text: stakeholder perspective.
							].
					].
				].
			html div 
				id: 'belangen';
				class: 'canvas-tile';
				style: 'left: 25%; top: 41%; height: 59%; width: 25%; border-right-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Belangen' ].
					(self session has: #stakeholder) ifTrue: [
						html div 
							class: 'canvas-tile-content';
							with: [ html render: (NSInterestsCanvasTile new stakeholder: (self session at: #stakeholder)). ].
						].
				].
			html div 
				id: 'alternatieven';
				class: 'canvas-tile';
				style: 'left: 50%; top: 41%; height: 59%; width: 25%; border-right-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Alternatieven' ].
				].
			html div 
				id: 'heeft-te-bieden';
				class: 'canvas-tile';
				style: 'left: 75%; top: 41%; height: 59%; width: 25%;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Heeft te bieden' ].
				].
		].
	
]
