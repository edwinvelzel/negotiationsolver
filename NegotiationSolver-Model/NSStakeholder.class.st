Class {
	#name : #NSStakeholder,
	#superclass : #NSModel,
	#instVars : [
		'name',
		'description',
		'type',
		'negotiationId',
		'importance',
		'perspective'
	],
	#category : #'NegotiationSolver-Model'
}

{ #category : #saving }
NSStakeholder class >> loadSequence [
	^ 3
]

{ #category : #accessing }
NSStakeholder >> description [
	^ description
]

{ #category : #accessing }
NSStakeholder >> description: aString [
	description := aString.
]

{ #category : #accessing }
NSStakeholder >> importance [
	^ importance
]

{ #category : #accessing }
NSStakeholder >> importance: anInteger [
	importance := anInteger.
]

{ #category : #initialization }
NSStakeholder >> initialize [
	super initialize.
	name := ''.
	description := ''.
	perspective := ''.
	importance := 50.
	type := 'decisionmaker'.

]

{ #category : #accessing }
NSStakeholder >> interests [
	^ NSInterest items select: [ :interest | interest stakeholderId = self id ].
]

{ #category : #accessing }
NSStakeholder >> name [
	^ name
]

{ #category : #accessing }
NSStakeholder >> name: aString [
	name := aString.
]

{ #category : #accessing }
NSStakeholder >> negotiation [
	^ NSNegotiation get: self negotiationId.
]

{ #category : #accessing }
NSStakeholder >> negotiation: aNegotiation [
	negotiationId := aNegotiation id.
]

{ #category : #accessing }
NSStakeholder >> negotiationId [
	^ negotiationId.
]

{ #category : #accessing }
NSStakeholder >> negotiationId: aNegotiationId [
	negotiationId := aNegotiationId.
]

{ #category : #accessing }
NSStakeholder >> perspective [
	^ perspective
]

{ #category : #accessing }
NSStakeholder >> perspective: anObject [
	perspective := anObject
]

{ #category : #accessing }
NSStakeholder >> sortKey [
	^ (100 - (self importance asInteger)).
]

{ #category : #accessing }
NSStakeholder >> type [
	^ type
]

{ #category : #accessing }
NSStakeholder >> type: aString [
	type := aString.
]

{ #category : #accessing }
NSStakeholder >> uniqueKey [
	^ (self negotiationId), '|', (self name).
]
