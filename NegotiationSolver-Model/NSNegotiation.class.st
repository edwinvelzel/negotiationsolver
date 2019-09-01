Class {
	#name : #NSNegotiation,
	#superclass : #NSModel,
	#instVars : [
		'name',
		'description',
		'type',
		'ownerId'
	],
	#category : #'NegotiationSolver-Model'
}

{ #category : #actions }
NSNegotiation class >> add: aNameString description: aDescriptionString type: aTypeString owner: aUser [
	| existingNegotiation negotiation |
	negotiation := self new.
	negotiation 
		name: aNameString;
		description: aDescriptionString;
		type: aTypeString;
		ownerId: aUser id.
	existingNegotiation := self get: negotiation id.
	(existingNegotiation isNil) ifFalse: [ 
		^ nil.
	]
	ifTrue: [
		self add: negotiation.
		^ negotiation.
	].

]

{ #category : #saving }
NSNegotiation class >> loadSequence [
	^ 2
]

{ #category : #accessing }
NSNegotiation class >> ownerItems: aUser [
	^ self items select: [ :item | item owner = aUser. ].
]

{ #category : #accessing }
NSNegotiation >> description [
	^ description
]

{ #category : #accessing }
NSNegotiation >> description: aString [
	description := aString.
]

{ #category : #initialization }
NSNegotiation >> initialize [
	super initialize.
	name := ''.
	description := ''.
	ownerId := ''.
	type := 'single-sided'.

]

{ #category : #accessing }
NSNegotiation >> name [
	^ name
]

{ #category : #accessing }
NSNegotiation >> name: aString [
	name := aString.
]

{ #category : #accessing }
NSNegotiation >> owner [
	^ NSUser get: self ownerId.
]

{ #category : #accessing }
NSNegotiation >> owner: aUser [
	ownerId := aUser id.
]

{ #category : #accessing }
NSNegotiation >> ownerId [
	^ ownerId
]

{ #category : #accessing }
NSNegotiation >> ownerId: aUserId [
	ownerId := aUserId.
]

{ #category : #accessing }
NSNegotiation >> sortKey [
	^ (self owner name), '|', (self type), '|', (self name)
]

{ #category : #accessing }
NSNegotiation >> stakeholders [
	^ NSStakeholder items select: [ :stakeholder | stakeholder negotiationId = self id ].
]

{ #category : #accessing }
NSNegotiation >> type [
	^ type
]

{ #category : #accessing }
NSNegotiation >> type: aString [
	type := aString.
]

{ #category : #accessing }
NSNegotiation >> uniqueKey [
	^ (self owner name), '|', (self name)
]
