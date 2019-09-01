"
The Sign On button in the header navbar.
"
Class {
	#name : #NSSignonHeaderButton,
	#superclass : #NSWidget,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSSignonHeaderButton >> renderContentOn: html [
	html button 
		type: 'button';
		class: 'btn btn-sm nav-link text-white float-right';
		onClick: (( html jQuery: 'body') load
			html: [ :r | 
				self session view: 'signon'.
				r render: NSRoot new.	
			]
		);
		with: [ 
			html icon
				class: 'fal fa-user-edit'.
			html text: ' Sign On'.
		].
]
