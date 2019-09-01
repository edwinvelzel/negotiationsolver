"
This is the name/logo of the site, mostly shown in the header.
"
Class {
	#name : #NSSiteBrand,
	#superclass : #NSWidget,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSSiteBrand >> renderContentOn: html with: aContentBlock callback: aCallbackBlock [
	html anchor
		class: 'navbar-brand text-white';
		style: 'padding:0;';
		callback: aCallbackBlock;
		with: aContentBlock.
]

{ #category : #rendering }
NSSiteBrand >> renderContentOn: html with: aContentBlock onClick: onClick [
	html anchor
		class: 'navbar-brand text-white';
		style: 'padding:0;';
		onClick: onClick;
		with: aContentBlock.
]
