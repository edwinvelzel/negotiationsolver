Class {
	#name : #NSTab,
	#superclass : #NSWidget,
	#instVars : [
		'id',
		'title',
		'content',
		'selected',
		'callback'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSTab >> callback [
	^ callback
]

{ #category : #accessing }
NSTab >> callback: aBlock [
	callback := aBlock
]

{ #category : #accessing }
NSTab >> content [ 
	^ content
]

{ #category : #accessing }
NSTab >> content: aBlock [
	content := aBlock
]

{ #category : #accessing }
NSTab >> id [ 
	^ id
]

{ #category : #accessing }
NSTab >> id: aString [
	id := aString
]

{ #category : #rendering }
NSTab >> renderContentOn: html [
	| activeClass |
	activeClass := ( (self selected) ifTrue: [ 'active' ] ifFalse: [ '' ] ).
	html div
		class: 'tab-pane fade show ', activeClass;
		id: self id;
		attributeAt: 'role' put: 'tabpanel';
		attributeAt: 'aria-labelledby' put: self id, '-tab';
		with: self content.

]

{ #category : #rendering }
NSTab >> renderTabOn: html [ 
	| activeClass |
	activeClass := ( (self selected) ifTrue: [ 'active' ] ifFalse: [ '' ] ).
	html listItem
		class: 'nav-item';
		with: [  
			html anchor 
				callback: self callback;
				class: 'nav-link ', activeClass;
				id: self id, '-tab';
				attributeAt: 'data-toggle' put: 'tab';
				url: '#', self id;
				attributeAt: 'role' put: 'tab';
				attributeAt: 'aria-controls' put: (self id);
				with: [ html text: (self title) ].
		]

]

{ #category : #accessing }
NSTab >> selected [ 
	^ selected
]

{ #category : #accessing }
NSTab >> selected: aBoolean [
	selected := aBoolean.
]

{ #category : #accessing }
NSTab >> title [ 
	^ title
]

{ #category : #accessing }
NSTab >> title: aString [
	title := aString
]
