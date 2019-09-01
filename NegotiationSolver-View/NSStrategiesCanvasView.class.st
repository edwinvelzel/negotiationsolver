Class {
	#name : #NSStrategiesCanvasView,
	#superclass : #NSCanvasView,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSStrategiesCanvasView >> renderContentOn: html [
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
				id: 'scenarios';
				class: 'canvas-tile';
				style: 'left: 0; top: 10%; height: 50%; width: 30%;border-bottom-width:1px;border-right-width:1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Strategie Scenario''s' ].
				].
			html div 
				id: 'uncertainties';
				class: 'canvas-tile';
				style: 'left: 0; top: 60%; height: 40%; width: 30%;border-right-width:1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Onzekere factoren' ].
				].
			html div 
				id: 'scenario-description';
				class: 'canvas-tile';
				style: 'left: 30%; top: 10%; height: 15%; width:70%;border-bottom-width:1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Toelichting' ].
				].
			html div 
				id: 'decision-tree';
				class: 'canvas-tile';
				style: 'left: 30%; top: 25%; height: 75%; width: 35%; border-right-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Beslisboom' ].
				].
			html div 
				id: 'results';
				class: 'canvas-tile';
				style: 'left: 65%; top: 25%; height: 75%; width: 35%;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Uitkomsten' ].
				].
		].
	
]
