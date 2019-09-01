"
The NSSession is the Session object for the NegotiationSolver website. It contains the current user and the current view.
"
Class {
	#name : #NSSession,
	#superclass : #WASession,
	#instVars : [
		'state'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #accessing }
NSSession >> at: aKey [
	^ self state at: aKey ifAbsent: nil.
]

{ #category : #accessing }
NSSession >> at: aKey put: anObject [
	self state at: aKey put: anObject
]

{ #category : #accessing }
NSSession >> has: aKey [
	^ self state includesKey: aKey
]

{ #category : #initializing }
NSSession >> initialize [ 
	super initialize.
	NSModel loadAll.
]

{ #category : #actions }
NSSession >> login: aUser [
	self at: #user put: aUser.
]

{ #category : #actions }
NSSession >> logout [
	self initialize.
]

{ #category : #actions }
NSSession >> remove: aKey [
	(self has: aKey) ifTrue: [ self state removeKey: aKey. ].
]

{ #category : #initializing }
NSSession >> reset [ 
	self initialize.
	state := Dictionary new.
	state at: #view put: 'home'.
	NSModel loadAll.
]

{ #category : #accessing }
NSSession >> state [
	(state isNil) ifTrue: [ state := Dictionary new.].
	^ state
]

{ #category : #accessing }
NSSession >> state: anObject [
	state := anObject
]

{ #category : #actions }
NSSession >> unregistered [ 
	super unregistered. 
	self reset.

]

{ #category : #accessing }
NSSession >> user [
	^ self at: #user.
]

{ #category : #accessing }
NSSession >> user: aUser [
	self at: #user put: aUser.
]

{ #category : #accessing }
NSSession >> view [
	(self at: #view) isNil ifTrue: [ self at: #view put: 'home' ].
	^ self at: #view.
]

{ #category : #accessing }
NSSession >> view: aView [
	self at: #view put: aView.
]
