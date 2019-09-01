Class {
	#name : #NSListItemClickable,
	#superclass : #NSWidget,
	#instVars : [
		'title',
		'iconLeft',
		'iconTitleLeft',
		'iconRight',
		'iconTitleRight',
		'callbackBlock',
		'with',
		'badgeText',
		'badgeClasses'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSListItemClickable >> badgeClasses [
	^ badgeClasses
]

{ #category : #accessing }
NSListItemClickable >> badgeClasses: anObject [
	badgeClasses := anObject
]

{ #category : #accessing }
NSListItemClickable >> badgeText [
	^ badgeText
]

{ #category : #accessing }
NSListItemClickable >> badgeText: anObject [
	badgeText := anObject
]

{ #category : #accessing }
NSListItemClickable >> callbackBlock [
	^ callbackBlock
]

{ #category : #accessing }
NSListItemClickable >> callbackBlock: aBlock [
	callbackBlock := aBlock
]

{ #category : #accessing }
NSListItemClickable >> iconLeft [
	^ iconLeft
]

{ #category : #accessing }
NSListItemClickable >> iconLeft: aString [
	iconLeft := aString
]

{ #category : #accessing }
NSListItemClickable >> iconRight [
	^ iconRight
]

{ #category : #accessing }
NSListItemClickable >> iconRight: aString [
	iconRight := aString
]

{ #category : #accessing }
NSListItemClickable >> iconTitleLeft [
	^ iconTitleLeft
]

{ #category : #accessing }
NSListItemClickable >> iconTitleLeft: aString [
	iconTitleLeft := aString
]

{ #category : #accessing }
NSListItemClickable >> iconTitleRight [
	^ iconTitleRight
]

{ #category : #accessing }
NSListItemClickable >> iconTitleRight: aString [
	iconTitleRight := aString
]

{ #category : #initializing }
NSListItemClickable >> initialize [ 
	super initialize.
	title := ''.
	iconLeft := ''.
	iconRight := ''.
	iconTitleLeft := ''.
	iconTitleRight := ''.
	callbackBlock := [  ].
	with := [  ].
]

{ #category : #rendering }
NSListItemClickable >> renderContentOn: html [
	html anchor
		class: 'list-group-item list-group-item-action';
		callback: self callbackBlock;
		with: [ 
			(self iconLeft size > 0) ifTrue: [ 
				html icon
					class: 'fal ', self iconLeft;
					title: self iconTitleLeft.
			].
			html text: ' ', self title.
			html span 
				with: self with.
			(self iconRight size > 0) ifTrue: [ 
				html icon
					class: 'fal float-right ', self iconRight;
					title: self iconTitleRight .
			].
			(self badgeText size > 0) ifTrue: [ 
				html span 
					class: badgeClasses;
					with: [ html text: badgeText ].
			].
		].

]

{ #category : #accessing }
NSListItemClickable >> title [
	^ title
]

{ #category : #accessing }
NSListItemClickable >> title: aString [
	title := aString
]

{ #category : #accessing }
NSListItemClickable >> with [
	^ with
]

{ #category : #accessing }
NSListItemClickable >> with: aBlock [
	with := aBlock
]
