Class {
	#name : #NSPositionsCanvasView,
	#superclass : #NSCanvasView,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSPositionsCanvasView >> renderContentOn: html [
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
				id: 'issues';
				class: 'canvas-tile';
				style: 'left: 0; top: 10%; height: 90%; width: 45%; border-right-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Onderwerpen' ].
				].
			html div 
				id: 'scores';
				class: 'canvas-tile';
				style: 'left: 45%; top: 10%; height: 90%; width: 20%; border-right-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Scores' ].
				].
			html div 
				id: 'stakeholders';
				class: 'canvas-tile';
				style: 'left: 65%; top: 10%; height: 90%; width: 35%;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Stakeholders' ].
				].
		].
	
]
