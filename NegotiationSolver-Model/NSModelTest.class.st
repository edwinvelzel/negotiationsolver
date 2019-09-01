Class {
	#name : #NSModelTest,
	#superclass : #Object,
	#category : #'NegotiationSolver-Model'
}

{ #category : #actions }
NSModelTest >> loadItems [ 
	self loadUsers.
	self loadNegotiations.

]

{ #category : #actions }
NSModelTest >> loadNegotiations [
	| user negotiation stakeholder |
	
	user := NSUser getByUniqueKey: 'edwinvelzel@icloud.com'.
	
	negotiation := NSNegotiation new name: 'Regioplan Zorgverzekeraar'; description: 'In overleg met regionale zorgaanbieders wil de regionale zorgverzekeraar een plan maken voor de toekomstige inrichting van de zorg.'; type: 'multi-sided'; owner: user.
	NSNegotiation add: negotiation.
	
	stakeholder := NSStakeholder new name: 'Zorgverzekeraar'; description: 'De regionale zorgverzekeraar'; type: 'decision-maker'; negotiation: negotiation; importance: 100.
	NSStakeholder add: stakeholder.
	
	stakeholder := NSStakeholder new name: 'Regionaal Topklinisch Ziekenhuis'; description: 'Het Topklinische ziekenhuis met een regionale functie'; type: 'decision-maker'; negotiation: negotiation; importance: 80.
	NSStakeholder add: stakeholder.
	
	negotiation := NSNegotiation new name: 'Organisatie & Infrastructuur'; description: 'In overleg tussen eerstelijn zorgaanbieders, zorgverzekeraars, VWS en NZa wordt een nieuw financieringsmodel ontwikkeld voor de Organisatie en Infrastructuur kosten in de eerste lijn.'; type: 'multi-sided'; owner: user.
	NSNegotiation add: negotiation.

]

{ #category : #actions }
NSModelTest >> loadUsers [
	NSUser signon: 'Edwin Velzel' email: 'edwinvelzel@icloud.com' password: '@@nnemer'.
]

{ #category : #actions }
NSModelTest >> resetItems [ 
	NSUser resetItems.
	NSNegotiation resetItems.
	NSStakeholder resetItems.
]

{ #category : #actions }
NSModelTest >> run [ 
	self resetItems.
	self loadItems.
]
