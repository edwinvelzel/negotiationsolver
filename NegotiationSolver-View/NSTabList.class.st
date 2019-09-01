Class {
	#name : #NSTabList,
	#superclass : #NSWidget,
	#instVars : [
		'id',
		'tabs'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSTabList >> id [
	^ id
]

{ #category : #accessing }
NSTabList >> id: aString [
	id := aString.
]

{ #category : #rendering }
NSTabList >> renderContentOn: html [
	html div 
"		class: 'classic-tabs';
"		with: [ 
			html unorderedList
				class: 'nav nav-tabs nav-justified md-tabs tabs-info';
" 				style: 'padding: 0; margin-left: 0; margin-right: 0; border-radius: 0.25rem 0.25rem 0 0;';
"				id: self id;
				attributeAt: 'role' put: 'tablist';
				with: [ 
					self tabs do: [ :tab | tab renderTabOn: html ].
				].
			html div
				class: 'tab-content card pt-5';
				id: self id, '-content';
				with: [ 
					self tabs do: [ :tab | tab renderContentOn: html ].
				].
		].		


]

{ #category : #accessing }
NSTabList >> tabs [
	^ tabs
]

{ #category : #accessing }
NSTabList >> tabs: aCollection [
	tabs := aCollection.
]
