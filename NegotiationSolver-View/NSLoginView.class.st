Class {
	#name : #NSLoginView,
	#superclass : #NSUserCredentialsView,
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSLoginView >> login [
	| user |
	user := NSUser login: (self email) password: (self password).
	(user isNil) ifTrue: [  
		^ false
	]
	ifFalse: [ 
		self session login: user.
		^ true
	].

]

{ #category : #rendering }
NSLoginView >> renderContentOn: html [
	html div
		class: 'main';
		style: 'position: relative;';
		with: [  
			html render: (NSInputPanel new title: 'Log In'; icon: 'fa-sign-in-alt'; with: [
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
				html render: (NSFormButton new 
					type: 'button';
					title: 'Log In'; 
					icon: 'fa-sign-in-alt'; 
					classes: 'float-right black text-white'; 
					onClick: ((html jQuery: 'body') load 
						serializeForm;
						html: [ :r | 
							(self login) ifTrue: [
								self session view: 'home'.
							].
							r render: NSRoot new.
						]
					)
				).
			]).
		]
]
