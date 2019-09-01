Class {
	#name : #NSNavbarMenuItem,
	#superclass : #NSWidget,
	#instVars : [
		'title',
		'active',
		'onClick'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSNavbarMenuItem >> active [
	^ active
]

{ #category : #accessing }
NSNavbarMenuItem >> active: anObject [
	active := anObject
]

{ #category : #accessing }
NSNavbarMenuItem >> onClick [
	^ onClick
]

{ #category : #accessing }
NSNavbarMenuItem >> onClick: anObject [
	onClick := anObject
]

{ #category : #rendering }
NSNavbarMenuItem >> renderContentOn: html [
	| activeClass |
	(self active) ifTrue: [ activeClass := 'active' ] ifFalse: [ activeClass := '' ].
	html listItem
		class: 'nav-item ', activeClass;
		with: [  
			html anchor 	
				class: 'nav-link waves-effect waves-light text-white';
				onClick: self onClick;
				with: [ 
					html text: self title. 
					(self active) ifTrue: [ 
						html span 
							class: 'sr-only';
							with: [ html text: '(current)' ].
					].
				].
		].
]

{ #category : #accessing }
NSNavbarMenuItem >> title [
	^ title
]

{ #category : #accessing }
NSNavbarMenuItem >> title: anObject [
	title := anObject
]
