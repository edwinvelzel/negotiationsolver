"
The Log Out button in the header navbar.
"
Class {
	#name : #NSLogoutHeaderButton,
	#superclass : #NSWidget,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSLogoutHeaderButton >> renderContentOn: html [
	html button 
		type: 'button';
		class: 'btn btn-sm nav-link text-white float-right';
		onClick: (( html jQuery: 'body') load
			html: [ :r | 
				self session logout.
				self session view: 'home'.
				r render: NSRoot new.	
			]);
		with: [ 
			html icon
				class: 'fal fa-sign-out-alt'.
			html text: ' Log Out'.
		].
]
