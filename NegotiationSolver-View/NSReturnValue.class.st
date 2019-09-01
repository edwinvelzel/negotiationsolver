Class {
	#name : #NSReturnValue,
	#superclass : #Object,
	#instVars : [
		'errors',
		'item'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSReturnValue >> errorMessage [ 
	| message |
	message := ''.
	(self errors isEmpty)
		ifFalse: [ 
			self errors do: [ :error | message := message, ' ', error ]
		].
	^ message trim.
]

{ #category : #accessing }
NSReturnValue >> errors [
	^ errors
]

{ #category : #accessing }
NSReturnValue >> errors: anObject [
	errors := anObject
]

{ #category : #initializing }
NSReturnValue >> initialize [
	errors := {  }.
	item := nil.
]

{ #category : #accessing }
NSReturnValue >> item [
	^ item
]

{ #category : #accessing }
NSReturnValue >> item: anObject [
	item := anObject
]
