Class {
	#name : #NSNegotiationCanvasView,
	#superclass : #NSCanvasView,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSNegotiationCanvasView >> renderContentOn: html [
	| negotiation |
	negotiation := self session at: #negotiation.
	html div
		id: 'canvas'; 
		class: 'canvas';
		with: [ 
			html div 
				id: 'description';
				class: 'canvas-tile';
				style: 'left: 0; top: 0; height: 25%; width: 70%; border-right-width: 1px;border-bottom-width:1px;';
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
							html text: negotiation description.
						].
					html anchor 
						class: 'canvas-title-button';
						title: 'Onderhandeling wijzigen';
						onClick: (( html jQuery: 'body') load
							html: [ :r | 
								r render: (NSRoot new modal: NSNegotiationEditFormView new).
							]
						);
						with: [  
							html icon 
								class: 'fal fa-pen'.
						].
				].
			html div 
				id: 'type';
				class: 'canvas-tile';
				style: 'left: 70%; top: 0; height: 25%; width: 30%; border-bottom-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Type' ].
				].
			html div 
				id: 'participants';
				class: 'canvas-tile';
				style: 'left: 0; top: 25%; height: 75%; width: 50%; border-right-width: 1px;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Deelnemers' ].
				].
			html div 
				id: 'facilitators';
				class: 'canvas-tile';
				style: 'left: 50%; top: 25%; height: 75%; width: 50%;';
				with: [ 
					html div 
						class: 'canvas-title';
						with: [ html text: 'Facilitators' ].
				].
		].
	
]
