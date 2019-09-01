Class {
	#name : #NSMainComponent,
	#superclass : #NSPageComponent,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSMainComponent >> renderContentOn: html [
	html div
		id: 'main'; 
		class: 'main';
		with: [ 
			(self session view = 'home') ifTrue: [ html render: NSHomeCanvasView new. ].
			(self session view = 'login') ifTrue: [ html render: NSLoginView new. ].
			(self session view = 'signon') ifTrue: [ html render: NSSignonView new. ].
			(self session view = 'negotiation') ifTrue: [ html render: NSNegotiationCanvasView new. ].
			(self session view = 'stakeholders') ifTrue: [ html render: NSStakeholdersCanvasView new. ].
			(self session view = 'interests') ifTrue: [ html render: NSInterestsCanvasView new. ].
			(self session view = 'issues') ifTrue: [ html render: NSIssuesCanvasView new. ].
			(self session view = 'positions') ifTrue: [ html render: NSPositionsCanvasView new. ].
			(self session view = 'dashboard') ifTrue: [ html render: NSDashboardCanvasView new. ].
			(self session view = 'strategies') ifTrue: [ html render: NSStrategiesCanvasView new. ].
		].
	
]
