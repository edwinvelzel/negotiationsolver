Class {
	#name : #NSSliderInput,
	#superclass : #NSWidget,
	#instVars : [
		'type',
		'title',
		'icon',
		'default',
		'callback',
		'min',
		'max',
		'step'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSSliderInput >> callback [
	^ callback
]

{ #category : #accessing }
NSSliderInput >> callback: anObject [
	callback := anObject
]

{ #category : #accessing }
NSSliderInput >> default [
	^ default
]

{ #category : #accessing }
NSSliderInput >> default: anObject [
	default := anObject
]

{ #category : #accessing }
NSSliderInput >> icon [
	^ icon
]

{ #category : #accessing }
NSSliderInput >> icon: anObject [
	icon := anObject
]

{ #category : #initialization }
NSSliderInput >> initialize [ 
	min := 0.
	max := 100.
	step := 5.
]

{ #category : #accessing }
NSSliderInput >> max [
	^ max
]

{ #category : #accessing }
NSSliderInput >> max: anObject [
	max := anObject
]

{ #category : #accessing }
NSSliderInput >> min [
	^ min
]

{ #category : #accessing }
NSSliderInput >> min: anObject [
	min := anObject
]

{ #category : #rendering }
NSSliderInput >> renderContentOn: html [
	| id |
	id := UUID new asString.
	html div
		class: 'md-form';
		style: 'margin-top:2rem;';
		with: [  
			html icon
				class: 'fal ', self icon, ' prefix'.
			html label 
				class: 'active';
				for: id;
				with: self title.
			html div
				class: 'range-field';
				style: 'margin-left:2.5rem;';
				with: [  
					html rangeInput
						style: 'margin-top: 1.5rem;';
						type: 'range';
						min: self min;
						max: self max;
						step: self step;
						id: id;
						value: self default;
						callback: self callback.
				]
		].
		
]

{ #category : #accessing }
NSSliderInput >> step [
	^ step
]

{ #category : #accessing }
NSSliderInput >> step: anObject [
	step := anObject
]

{ #category : #accessing }
NSSliderInput >> title [
	^ title
]

{ #category : #accessing }
NSSliderInput >> title: anObject [
	title := anObject
]

{ #category : #accessing }
NSSliderInput >> type [
	^ type
]

{ #category : #accessing }
NSSliderInput >> type: anObject [
	type := anObject
]
