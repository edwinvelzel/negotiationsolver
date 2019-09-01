Class {
	#name : #NSUser,
	#superclass : #NSModel,
	#instVars : [
		'name',
		'email',
		'password'
	],
	#category : #'NegotiationSolver-Model'
}

{ #category : #'instance-creation' }
NSUser class >> findByEmail: anEmail [

	| users |
	users := NSUser items select: [ :item | item email = anEmail ].
	(users size = 0) ifTrue: [ 
		^ nil
	]
	ifFalse: [ 
		^ users at: 1.
	].
]

{ #category : #saving }
NSUser class >> loadSequence [
	^ 1
]

{ #category : #'instance-creation' }
NSUser class >> login: anEmail password: aPassword [

	| users |
	users := NSUser items select: [ :item | item email = anEmail and: item password = aPassword ].
	(users size = 0) ifTrue: [ 
		^ nil
	]
	ifFalse: [ 
		^ users at: 1.
	].
]

{ #category : #'instance-creation' }
NSUser class >> signon: aName email: anEmail password: aPassword [

	| existingUser user |
	user := NSUser new.
	user name: aName.
	user email: anEmail.
	user password: aPassword.
	existingUser := self get: user uniqueKey.
	(existingUser isNil) ifTrue: [ 
		self add: user.
		^ user.
	]
	ifFalse: [ 
		^ nil
	].
]

{ #category : #accessing }
NSUser >> email [
	^ email
]

{ #category : #accessing }
NSUser >> email: aString [
	email := aString.
]

{ #category : #accessing }
NSUser >> name [
	^ name
]

{ #category : #accessing }
NSUser >> name: aString [
	name := aString.
]

{ #category : #accessing }
NSUser >> negotiations [
	^ self ownerNegotiations asOrderedCollection
]

{ #category : #accessing }
NSUser >> ownerNegotiations [
	^ NSNegotiation ownerItems: self.
]

{ #category : #accessing }
NSUser >> participantNegotiations [
	^ NSNegotiation participantItems: self.
]

{ #category : #accessing }
NSUser >> password [
	^ password.
]

{ #category : #accessing }
NSUser >> password: aString [
	password := aString.
]

{ #category : #accessing }
NSUser >> sortKey [
	^ self name.
]

{ #category : #accessing }
NSUser >> uniqueKey [
	^ self email.
]
