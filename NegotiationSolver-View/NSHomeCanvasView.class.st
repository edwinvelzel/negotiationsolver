Class {
	#name : #NSHomeCanvasView,
	#superclass : #NSCanvasView,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSHomeCanvasView >> renderContentOn: html [
	html div
		id: 'canvas'; 
		class: 'canvas';
		with: [ 
			html div 
				id: 'navigatie';
				class: 'canvas-tile';
				style: 'left: 0; top: 0; height: 100%; width: 20%; border-right-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Ga Naar...' ].
				].
			html div 
				id: 'introductie';
				class: 'canvas-tile';
				style: 'left: 20%; top: 0; height: 50%; width: 60%; border-bottom-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Introductie' ].
				].
			html div 
				id: 'nieuws';
				class: 'canvas-tile';
				style: 'left: 80%; top: 0; height: 100%; width: 20%; border-left-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Nieuws' ].
				].
			html div 
				id: 'openbare-onderhandelingen';
				class: 'canvas-tile';
				style: 'left: 20%; top: 50%; height: 50%; width: 30%;border-right-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Openbare Onderhandelingen' ].
				].
			html div 
				id: 'mijn-onderhandelingen';
				class: 'canvas-tile';
				style: 'left: 50%; top: 50%; height: 50%; width: 30%;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Mijn Onderhandelingen' ].
					html div 
						class: 'canvas-tile-content';
						with: [ html render: NSNegotiationsCanvasTile new. ]
				].
		].
	
]
