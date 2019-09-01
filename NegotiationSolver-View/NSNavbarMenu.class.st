Class {
	#name : #NSNavbarMenu,
	#superclass : #NSWidget,
	#instVars : [
		'menuItems'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSNavbarMenu >> menuItems [
	^ menuItems
]

{ #category : #accessing }
NSNavbarMenu >> menuItems: anObject [
	menuItems := anObject
]

{ #category : #rendering }
NSNavbarMenu >> renderContentOn: html [
	| id |
	id := UUID new asString.
	html button 
		class: 'navbar-toggler';
		type: 'button';
		attributeAt: 'data-toggle' put: 'collapse';
		attributeAt: 'data-target' put: '#', id;
		attributeAt: 'aria-controls' put: id;
		attributeAt: 'aria-expanded' put: 'false';
		attributeAt: 'aria-label' put: 'Toggle navigation';
		with: [ 
			html span
				class: 'navbar-toggler-icon'
		].
	html div
		class: 'collapse navbar-collapse';
		id: id;
		with: [  
			html unorderedList
				class: 'navbar-nav mr-auto';
				with: [  
					self menuItems do: [ :menuItem | 
						html render: menuItem.
					].
				].
		].
]
