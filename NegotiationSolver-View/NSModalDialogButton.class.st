Class {
	#name : #NSModalDialogButton,
	#superclass : #NSWidget,
	#instVars : [
		'id',
		'buttonIcon',
		'buttonTitle',
		'buttonClasses',
		'dialogTitle',
		'dialogClasses',
		'dialogContent',
		'dialogButtons',
		'with'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSModalDialogButton >> buttonClasses [
	^ buttonClasses
]

{ #category : #accessing }
NSModalDialogButton >> buttonClasses: anObject [
	buttonClasses := anObject
]

{ #category : #accessing }
NSModalDialogButton >> buttonIcon [
	^ buttonIcon
]

{ #category : #accessing }
NSModalDialogButton >> buttonIcon: anObject [
	buttonIcon := anObject
]

{ #category : #accessing }
NSModalDialogButton >> buttonTitle [
	^ buttonTitle
]

{ #category : #accessing }
NSModalDialogButton >> buttonTitle: anObject [
	buttonTitle := anObject
]

{ #category : #accessing }
NSModalDialogButton >> dialogButtons [
	^ dialogButtons
]

{ #category : #accessing }
NSModalDialogButton >> dialogButtons: anObject [
	dialogButtons := anObject
]

{ #category : #accessing }
NSModalDialogButton >> dialogClasses [
	^ dialogClasses
]

{ #category : #accessing }
NSModalDialogButton >> dialogClasses: anObject [
	dialogClasses := anObject
]

{ #category : #accessing }
NSModalDialogButton >> dialogContent [
	^ dialogContent
]

{ #category : #accessing }
NSModalDialogButton >> dialogContent: anObject [
	dialogContent := anObject
]

{ #category : #accessing }
NSModalDialogButton >> dialogTitle [
	^ dialogTitle
]

{ #category : #accessing }
NSModalDialogButton >> dialogTitle: anObject [
	dialogTitle := anObject
]

{ #category : #accessing }
NSModalDialogButton >> id [
	^ id
]

{ #category : #accessing }
NSModalDialogButton >> id: anObject [
	id := anObject
]

{ #category : #rendering }
NSModalDialogButton >> renderContentOn: html [
	| btn |
	btn := NSButtonWidget new 
		type: 'button';
		classes: 'btn ', self buttonClasses;
		attributes: {{'data-toggle' . 'modal'} . {'data-target' . ('#', self id)}};
		with: [ 
			html icon
				class: 'fas ', self buttonIcon.
			html text: ' ', self buttonTitle.
		].
	html render: btn.
	
	html div 
		class: 'modal fade';
		id: self id;
		attributeAt: 'tabindex' put: '-1';
		attributeAt: 'aria-labelledby' put: (self id), '-label';
		attributeAt: 'aria-hidden' put: 'true';
		attributeAt: 'role' put: 'dialog';
		with: [  
			html div 
				class: 'modal-dialog ', self dialogClasses;
				attributeAt: 'role' put: 'document';
				with: [  
					html div 
						class: 'modal-content';
						with: [ 
							html render: self dialogContent.
						].
				].
		].
 
]

{ #category : #accessing }
NSModalDialogButton >> with [
	^ with
]

{ #category : #accessing }
NSModalDialogButton >> with: anObject [
	with := anObject
]
