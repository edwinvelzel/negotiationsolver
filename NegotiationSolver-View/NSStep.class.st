Class {
	#name : #NSStep,
	#superclass : #NSWidget,
	#category : #'NegotiationSolver-View'
}

{ #category : #rendering }
NSStep >> renderContentOn: html title: aTitle content: contentBlock actions: actionsBlock [
	html listItem
		class: 'step';
		with: [  
			html div 
				class: 'step-title waves-effect waves-dark';
				attributeAt: 'data-step-label' put: aTitle;
				with: [ html text: aTitle ].
			html div 
				class: 'step-new-content';
				with: [  
					html div 
						class: 'row';
						with: [ 
							html div
								class: 'md-form col-12 ml-auto';
								with: contentBlock.
						].
					html div 
						class: 'step-actions';
						with: actionsBlock.
				].
		].


]
