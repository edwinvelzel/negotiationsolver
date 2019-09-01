Class {
	#name : #NSIssuesCanvasView,
	#superclass : #NSCanvasView,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSIssuesCanvasView >> renderContentOn: html [
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
				id: 'categories';
				class: 'canvas-tile';
				style: 'left: 0; top: 10%; height: 70%; width: 40%; border-right-width: 1px;border-bottom-width:1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Categorieën' ].
				].
			html div 
				id: 'category-description';
				class: 'canvas-tile';
				style: 'left: 0; top: 80%; height: 20%; width: 40%; border-right-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Categorie Omschrijving' ].
				].
			html div 
				id: 'issues';
				class: 'canvas-tile';
				style: 'left: 40%; top: 10%; height: 70%; width: 60%; border-bottom-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Onderwerpen' ].
				].
			html div 
				id: 'issue-description';
				class: 'canvas-tile';
				style: 'left: 40%; top: 80%; height: 20%; width: 60%;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Onderwerp Toelichting' ].
				].
		].
	
]
