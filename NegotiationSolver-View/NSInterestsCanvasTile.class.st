Class {
	#name : #NSInterestsCanvasTile,
	#superclass : #NSCanvasTileView,
	#instVars : [
		'stakeholder'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSInterestsCanvasTile >> renderContentOn: html [
	""
	
	(self stakeholder isNil) ifFalse: [ 
		self stakeholder interests do: [ :interest |
			html div 
				class: 'canvas-list-item ';
				onClick: (( html jQuery: 'body') load
					html: [ :r | 
						r render: (NSRoot new modal: (NSInterestEditFormView new interest: interest)).
					]
				);
				with: [
					html anchor 
						with: [  
							html text: (interest name).
							html span 
								class: 'badge badge-pill badge-light';
								style: 'position: absolute;right:0;';
								with: (interest importance).
						].
				].
			].
		html anchor 
			class: 'canvas-title-button';
			title: 'Belang toevoegen';
			onClick: (( html jQuery: 'body') load
				html: [ :r | 
					r render: (NSRoot new modal: (NSInterestAddFormView new stakeholder: self stakeholder)).
				]
			);
			with: [  
				html icon 
					class: 'fal fa-plus'.
			].
	].

]

{ #category : #accessing }
NSInterestsCanvasTile >> stakeholder [
	^ stakeholder
]

{ #category : #accessing }
NSInterestsCanvasTile >> stakeholder: anObject [
	stakeholder := anObject
]
