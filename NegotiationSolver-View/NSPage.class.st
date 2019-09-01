"
A NSPage is a full webpage of NegotiationSolver. It contains several NSPageSections.
"
Class {
	#name : #NSPage,
	#superclass : #NSComponent,
	#instVars : [
		'children',
		'message'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #children }
NSPage >> children [
	^ super children, children.
]

{ #category : #children }
NSPage >> footer [
	^ NSFooterComponent new parent: self.
]

{ #category : #children }
NSPage >> header [
	^ NSHeaderComponent new parent: self.
]

{ #category : #initialization }
NSPage >> initialize [
	super initialize.
	children := Array with: (self header) with: (self main) with: (self footer).

]

{ #category : #children }
NSPage >> main [
	self subclassResponsibility .
]

{ #category : #accessing }
NSPage >> message [
	^ message
]

{ #category : #accessing }
NSPage >> message: anObject [
	message := anObject
]

{ #category : #rendering }
NSPage >> renderContentOn: html [
	self session view: self view.
	
	html form 
		with: [
			children do: [ :child | 
				html render: child. ].
		].
	html script url: 'js/jquery-3.4.1.min.js'.
	html script url: 'js/popper.min.js'.
	html script url: 'js/bootstrap.min.js'.
	html script url: 'js/mdb.min.js'.
	html script url: 'js/addons-pro/stepoper.min.js'.
	html script url: 'js/negotiationsolver.js'.
	html script url: 'https://kit.fontawesome.com/8cabec01ef.js'.

]

{ #category : #initialization }
NSPage >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: '/css/all.min.css'.
	anHtmlRoot stylesheet url: '/css/bootstrap.min.css'.
	anHtmlRoot stylesheet url: '/css/mdb.min.css'.
	anHtmlRoot stylesheet url: '/css/addons-pro/stepper.min.css'.
	anHtmlRoot stylesheet url: '/css/mdb.min.css'.
	anHtmlRoot stylesheet url: '/css/style.css'.

]

{ #category : #accessing }
NSPage >> view [ 
	self subclassResponsibility.
]
