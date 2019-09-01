"
The NSHomePage is the Home Page of the NegotiationSolver website. 

The application is registered in the class initialization method of NSHomePage.

The static files are linked in the updateRoot method.
"
Class {
	#name : #NSHomePage,
	#superclass : #NSPage,
	#category : #'NegotiationSolver-View'
}

{ #category : #'class initialization' }
NSHomePage class >> initialize [
	"Register the application and link NSSession as Session class."
	
	| application server |

	ZnZincStaticServerAdaptor startOn: 8080 andServeFilesFrom: FileSystem disk workingDirectory pathString. 
	server:=ZnZincStaticServerAdaptor default server. 
	server logToTranscript; 
 	      debugMode: true. 
	application := WAAdmin register: self asApplicationAt: 'negotiationsolver'.
	application preferenceAt: #sessionClass put: NSSession.

]

{ #category : #children }
NSHomePage >> main [
	^ NSHomeCanvasView new.
]

{ #category : #accessing }
NSHomePage >> view [
	^ 'home'
]
