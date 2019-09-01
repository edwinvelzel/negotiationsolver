Class {
	#name : #NSRoot,
	#superclass : #NSComponent,
	#instVars : [
		'modal'
	],
	#category : #'NegotiationSolver-View'
}

{ #category : #initialization }
NSRoot class >> initialize [
	"Register the application and link NSSession as Session class."
	
	| application server |

	ZnZincStaticServerAdaptor startOn: 8080 andServeFilesFrom: FileSystem disk workingDirectory pathString. 
	server:=ZnZincStaticServerAdaptor default server. 
	server logToTranscript; 
 	      debugMode: true. 
	application := WAAdmin register: self asApplicationAt: 'negotiationsolver'.
	application preferenceAt: #sessionClass put: NSSession.

]

{ #category : #initialization }
NSRoot >> initialize [ 
	modal := nil.
]

{ #category : #accessing }
NSRoot >> modal [
	^ modal
]

{ #category : #accessing }
NSRoot >> modal: anObject [
	modal := anObject
]

{ #category : #rendering }
NSRoot >> renderContentOn: html [

	html form 
		with: [  
			html render: NSHeaderComponent new.
			html render: NSMainComponent new.
			html render: NSFooterComponent new. 
			(self modal isNil) ifFalse: [  
				html div 
					class: 'ns-modal-overlay';
					with: [ 
						html div 
						class: 'ns-modal';
						with: [ html render: self modal].
					].
			].
		].

	html script url: 'js/jquery-3.4.1.min.js'.
	html script url: 'js/popper.min.js'.
	html script url: 'js/bootstrap.min.js'.
	html script url: 'js/mdb.min.js'.
	html script url: 'js/addons-pro/stepoper.min.js'.
	html script url: 'js/negotiationsolver.js'.
	html script url: 'https://kit.fontawesome.com/8cabec01ef.js'.

]

{ #category : #initialization }
NSRoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: '/css/all.min.css'.
	anHtmlRoot stylesheet url: '/css/bootstrap.min.css'.
	anHtmlRoot stylesheet url: '/css/mdb.min.css'.
	anHtmlRoot stylesheet url: '/css/addons-pro/stepper.min.css'.
	anHtmlRoot stylesheet url: '/css/mdb.min.css'.
	anHtmlRoot stylesheet url: '/css/style.css'.

]
