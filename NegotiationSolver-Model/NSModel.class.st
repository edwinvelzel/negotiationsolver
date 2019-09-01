Class {
	#name : #NSModel,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#classInstVars : [
		'Items'
	],
	#category : #'NegotiationSolver-Model'
}

{ #category : #accessing }
NSModel class >> add: anItem [
	| existingItems |
	existingItems := self items select: [ :item | item uniqueKey = anItem uniqueKey ]. 
	(existingItems isEmpty) ifTrue: [ 
		Items add: anItem.
		self save.
		^ anItem	
	]
	ifFalse: [ ^ nil ]

]

{ #category : #'instance creation' }
NSModel class >> get: anId [
	| foundItems |
	foundItems := self items select: [ :item | item id = anId ].
	(foundItems isNotEmpty) ifTrue: [ ^ foundItems at: 1 ] ifFalse: [  ^ nil ].
	
]

{ #category : #'instance creation' }
NSModel class >> getByUniqueKey: aUniqueKey [
	| foundItems |
	foundItems := self items select: [ :item | item uniqueKey = aUniqueKey ].
	(foundItems isNotEmpty) ifTrue: [ ^ foundItems at: 1 ] ifFalse: [  ^ nil ].
	
]

{ #category : #initialization }
NSModel class >> initialize [
	Items := SortedCollection sortBlock: self sortBlock.
]

{ #category : #accessing }
NSModel class >> items [
	(Items isNil) ifTrue: [ Items := SortedCollection sortBlock: self sortBlock. ].
	^ Items
]

{ #category : #saving }
NSModel class >> load [ 
	| fs content reader items fields |
	fields := NSModel instanceVariables, self instanceVariables.
	self resetItems.
	fs := FileStream fileNamed: 'data/', self name asString, '.csv'. 
	content := fs contentsOfEntireFile.
	fs close.

	reader := (NeoCSVReader on: content withCRs readStream).
	reader recordClass: self.
	fields do: [ :variable | 
		reader addField: ((variable asString, ':') asSymbol)
	].
	items := reader upToEnd.
	items isEmpty ifFalse: [
		items allButFirst do: [ :item | self add: item ].
	].
]

{ #category : #saving }
NSModel class >> loadAll [
	(NSModel subclasses sort: [ :a :b | a loadSequence <= b loadSequence  ]) do: [ :subclass | 
		subclass load. 
	].
]

{ #category : #saving }
NSModel class >> loadSequence [
	self subclassResponsibility.
]

{ #category : #actions }
NSModel class >> newId [
	^ UUID new asString.
]

{ #category : #actions }
NSModel class >> remove: aNegotiation [
	Items remove: aNegotiation.
	self save.
]

{ #category : #accessing }
NSModel class >> resetItems [
	Items := SortedCollection sortBlock: NSNegotiation sortBlock.
]

{ #category : #saving }
NSModel class >> save [ 
	| s fs fields |
	fields := NSModel instanceVariables, self instanceVariables.
	s := String streamContents: [ :stream |
	   (NeoCSVWriter on: stream)
			nextPut: (fields collect: [ :variable | variable asString ]);
	      addFields: fields;
	      nextPutAll: self items].

	fs := FileStream forceNewFileNamed: 'data/', self name asString, '.csv'. 
	fs nextPutAll: s. 
	fs close.

]

{ #category : #saving }
NSModel class >> saveAll [
	NSModel subclasses do: [ :subclass | subclass save. ].
]

{ #category : #accessing }
NSModel class >> sortBlock [
	^ [ :a :b | a sortKey <= b sortKey ].
]

{ #category : #actions }
NSModel class >> update: anOldItem to: aNewItem [
	| result |
	aNewItem id: anOldItem id.
	Items remove: anOldItem.
	result := self add: aNewItem.
	(result isNil) ifTrue: [ 
		self add: anOldItem.
		^ nil
	]
	ifFalse: [  
		^ result
	].

]

{ #category : #accessing }
NSModel >> id [
	^ id.
]

{ #category : #accessing }
NSModel >> id: aString [
	id := aString.
]

{ #category : #initialization }
NSModel >> initialize [ 
	id := UUID new asString.
]

{ #category : #accessing }
NSModel >> sortKey [
	self subclassResponsibility.
]

{ #category : #accessing }
NSModel >> uniqueKey [
	self subclassResponsibility.
]
