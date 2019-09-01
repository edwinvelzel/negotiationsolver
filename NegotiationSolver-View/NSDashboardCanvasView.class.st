Class {
	#name : #NSDashboardCanvasView,
	#superclass : #NSCanvasView,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSDashboardCanvasView >> renderContentOn: html [
	html div
		id: 'canvas'; 
		class: 'canvas';
		with: [ 
			html div 
				id: 'negotiation';
				class: 'canvas-tile';
				style: 'left: 0; top: 0; height: 10%; width: 100%;border-bottom-width:1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Onderhandeling' ].
				].
			html div 
				id: 'group-title';
				class: 'canvas-tile';
				style: 'left: 0; top: 10%; height: 6%; width: 40%;border-bottom-width:1px;border-right-width:1px;text-align:center;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Groep' ].
				].
			html div 
				id: 'stakeholder-title';
				class: 'canvas-tile';
				style: 'left: 40%; top: 10%; height: 6%; width: 40%;border-bottom-width:1px;border-right-width:1px;text-align:center;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Stakeholder' ].
				].
			html div 
				id: 'group-results';
				class: 'canvas-tile';
				style: 'left: 0; top: 16%; height: 40%; width:40%; border-right-width: 1px;border-bottom-width:1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Resultaten' ].
				].
			html div 
				id: 'group-solution';
				class: 'canvas-tile';
				style: 'left: 0; top: 56%; height: 44%; width: 40%; border-right-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Beste oplossing' ].
				].
			html div 
				id: 'stakeholder-results';
				class: 'canvas-tile';
				style: 'left: 40%; top: 16%; height: 40%; width: 40%; border-right-width: 1px;border-bottom-width:1px;border-right-width:1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Resultaten' ].
				].
			html div 
				id: 'stakeholder-solution';
				class: 'canvas-tile';
				style: 'left: 40%; top: 56%; height: 44%; width: 40%;border-right-width:1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Beste oplossing' ].
				].
			html div 
				id: 'stakeholders';
				class: 'canvas-tile';
				style: 'left: 80%; top: 10%; height: 90%; width: 20%;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Stakeholders' ].
				].
		].
	
]
