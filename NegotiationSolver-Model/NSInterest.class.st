Class {
	#name : #NSInterest,
	#superclass : #NSModel,
	#instVars : [
		'name',
		'description',
		'stakeholderId',
		'importance'
	],
	#category : #'NegotiationSolver-Model'
}

{ #category : #accessing }
NSInterest class >> loadSequence [
	^ 3
]

{ #category : #accessing }
NSInterest >> description [
	^ description
]

{ #category : #accessing }
NSInterest >> description: anObject [
	description := anObject
]

{ #category : #accessing }
NSInterest >> importance [
	^ importance
]

{ #category : #accessing }
NSInterest >> importance: anObject [
	importance := anObject
]

{ #category : #accessing }
NSInterest >> name [
	^ name
]

{ #category : #accessing }
NSInterest >> name: anObject [
	name := anObject
]

{ #category : #accessing }
NSInterest >> sortKey [
	^ (100 - (self importance asInteger)).
]

{ #category : #accessing }
NSInterest >> stakeholder [
	^ NSStakeholder get: self stakeholderId.
]

{ #category : #accessing }
NSInterest >> stakeholder: aStakeholder [
	stakeholderId := aStakeholder id.
]

{ #category : #accessing }
NSInterest >> stakeholderId [
	^ stakeholderId
]

{ #category : #accessing }
NSInterest >> stakeholderId: anObject [
	stakeholderId := anObject
]

{ #category : #accessing }
NSInterest >> uniqueKey [
	^ (self stakeholderId), '|', (self name).
]
