"
The standard Header section.
"
Class {
	#name : #NSHeaderComponent,
	#superclass : #NSPageComponent,
	#instVars : [
		'parent'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #actions }
NSHeaderComponent >> home [
	parent show: NSHomePage new.
]

{ #category : #actions }
NSHeaderComponent >> login [
	parent show: NSLoginPage new.
]

{ #category : #actions }
NSHeaderComponent >> logout [
	self session logout.
	parent show: NSHomePage new.
]

{ #category : #accessing }
NSHeaderComponent >> parent [
	^ parent
]

{ #category : #accessing }
NSHeaderComponent >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
NSHeaderComponent >> renderContentOn: html [
	html navigation 
		id: 'header';
		class: 'header';
		class: 'navbar navbar-dark black navbar-expand-lg fixed-top';
		with: [ 
			| menuItems |
			NSSiteBrand new renderContentOn: html 
				with: [ html text: 'Negotiation Solver' ] 
				onClick: (( html jQuery: 'body') load
					html: [ :r | 
						self session at: 'view' put: 'home'.
						r render: NSRoot new. 
					]
				).
			menuItems := OrderedCollection new.
			menuItems add: (NSNavbarMenuItem new 
				title: 'Home';
				active: (self session view = 'home');
				onClick: (( html jQuery: 'body') load
					html: [ :r | 
						self session at: 'view' put: 'home'.
						r render: NSRoot new. 
					]
				)
			).
			html render: (NSNavbarMenu new menuItems: menuItems).
			html div 
				class: 'float-right';
				with: [  
					(self session has: #user) ifFalse: [  
						(self session view = 'login') ifFalse: [ html render: NSLoginHeaderButton new. ].
						(self session view = 'signon') ifFalse: [ html render: NSSignonHeaderButton new. ].
					]
					ifTrue: [ 
						html render: NSLogoutHeaderButton new. ].
				].
		].
]

{ #category : #actions }
NSHeaderComponent >> signon [
	parent show: NSSignonPage new.
]

{ #category : #actions }
NSHeaderComponent >> switchPage: aView [
	(aView = 'home') ifTrue: [ 
		self session view: aView.
		^ NSHomePage new. 
	].
	^ nil
]
