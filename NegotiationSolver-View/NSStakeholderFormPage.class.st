Class {
	#name : #NSStakeholderFormPage,
	#superclass : #NSPage,
	#instVars : [
		'name',
		'description',
		'type',
		'importance'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSStakeholderFormPage >> description [
	^ description
]

{ #category : #accessing }
NSStakeholderFormPage >> description: anObject [
	description := anObject
]

{ #category : #accessing }
NSStakeholderFormPage >> name [
	^ name
]

{ #category : #accessing }
NSStakeholderFormPage >> name: anObject [
	name := anObject
]

{ #category : #accessing }
NSStakeholderFormPage >> type [
	^ type
]

{ #category : #accessing }
NSStakeholderFormPage >> type: anObject [
	type := anObject
]
