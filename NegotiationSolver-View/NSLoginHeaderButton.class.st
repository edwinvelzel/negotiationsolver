"
The Log In button in de header navbar.
"
Class {
	#name : #NSLoginHeaderButton,
	#superclass : #NSWidget,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSLoginHeaderButton >> renderContentOn: html [
	html button 
		type: 'button';
		class: 'btn btn-sm nav-link text-white btn-outline-white float-right';
		onClick: (( html jQuery: 'body') load
			html: [ :r | 
				self session view: 'login'.
				r render: NSRoot new.	
			]
		);
		with: [ 
			html icon
				class: 'fal fa-sign-in'.
			html text: ' Log In'.
		].
]
