Class {
	#name : #NSStakeholderFormView,
	#superclass : #NSStakeholderView,
	#instVars : [
		'name',
		'description',
		'type',
		'importance',
		'perspective'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSStakeholderFormView >> description [
	^ description
]

{ #category : #accessing }
NSStakeholderFormView >> description: anObject [
	description := anObject
]

{ #category : #accessing }
NSStakeholderFormView >> importance [
	^ importance
]

{ #category : #accessing }
NSStakeholderFormView >> importance: anObject [
	importance := anObject
]

{ #category : #accessing }
NSStakeholderFormView >> name [
	^ name
]

{ #category : #accessing }
NSStakeholderFormView >> name: anObject [
	name := anObject
]

{ #category : #accessing }
NSStakeholderFormView >> perspective [
	^ perspective
]

{ #category : #accessing }
NSStakeholderFormView >> perspective: anObject [
	perspective := anObject
]

{ #category : #accessing }
NSStakeholderFormView >> type [
	^ type
]

{ #category : #accessing }
NSStakeholderFormView >> type: anObject [
	type := anObject
]
