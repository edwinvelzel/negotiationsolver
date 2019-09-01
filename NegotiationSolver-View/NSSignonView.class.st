"
The Main section of the Signon page.
"
Class {
	#name : #NSSignonView,
	#superclass : #NSUserCredentialsView,
	#instVars : [
		'name',
		'passwordVerification'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSSignonView >> name [
	^ name
]

{ #category : #accessing }
NSSignonView >> name: anObject [
	name := anObject
]

{ #category : #accessing }
NSSignonView >> passwordVerification [
	^ passwordVerification
]

{ #category : #accessing }
NSSignonView >> passwordVerification: anObject [
	passwordVerification := anObject
]

{ #category : #rendering }
NSSignonView >> renderContentOn: html [
	super renderContentOn: html.
	html div
		class: 'main';
		style: 'position: relative;';
		with: [  
			html render: (NSInputPanel new title: 'Sign On'; icon: 'fa-sign-in-alt'; with: [
				html render: (NSTextInput new  
					type: 'name';
					title: 'Name'; 
					icon: 'fa-user'; 
					callback: [ :value | self name: value. ]
				).
				html render: (NSTextInput new
					type: 'email';
					title: 'E-mail'; 
					icon: 'fa-envelope'; 
					callback: [ :value | self email: value. ]
				).
				html render: (NSTextInput new 
					type: 'password';
					title: 'Password'; 
					icon: 'fa-key'; 
					callback: [ :value | self password: value. ]
				).
				html render: (NSTextInput new 
					type: 'password';
					title: 'Passwordverification'; 
					icon: 'fa-key'; 
					callback: [ :value | self passwordVerification: value. ]
				).
				html render: (NSFormButton new 
					type: 'button';
					title: 'Sign On'; 
					icon: 'fa-sign-in-alt'; 
					classes: 'float-right black text-white'; 
					onClick: ((html jQuery: 'body') load 
						serializeForm;
						html: [ :r | self signon: r.	]
					)
				).
			]).
		]
]

{ #category : #actions }
NSSignonView >> signon: html [
	| user nextPage errors |
	errors := ''.
	(self password = self passwordVerification) ifFalse: [ errors := errors, 'Password is not equal to verification password. '. ].
	(self password size >= 8) ifFalse: [ errors := errors, 'Password must have 8 or more characters. ' ].
	(errors size > 0) ifTrue: [ 
		nextPage := NSSignonView new message: (NSAlert new text: errors; classes: 'alert-danger'). 
	]
	ifFalse: [ 
		user := NSUser signon: (self name) email: (self email) password: (self password).
		(user isNil) ifTrue: [  
			nextPage := NSSignonPage new message: (NSAlert new text: 'This email is already in use. Please try again or Log In with this email.'; classes: 'alert-danger').
		]
		ifFalse: [ 
			self session login: user.
			nextPage := NSHomePage new message: (NSAlert new text: 'Hello ', user name, ', welcome to Negotiation Solver!'; classes: 'alert-success').
		].
	].
	html render: nextPage.

]
