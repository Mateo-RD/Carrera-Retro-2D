Class {
	#name : 'Vehiculo',
	#superclass : 'Object',
	#instVars : [
		'posicionX',
		'velocidad',
		'vida',
		'ruta'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'as yet unclassified' }
Vehiculo >> acelerar [

	velocidad:= velocidad + 1.

]

{ #category : 'as yet unclassified' }
Vehiculo >> frenar [


	velocidad:= velocidad - 1.

]

{ #category : 'initialization' }
Vehiculo >> initialize [ 

posicionX :=0.
velocidad := 0.
vida:= 3.

]

{ #category : 'as yet unclassified' }
Vehiculo >> moverDerecha [


(posicionX < (ruta limiteDerecho) ) ifTrue: [ 
	posicionX:= posicionX + 10.	
	 ]
	ifFalse: [ 
		(velocidad > 10) ifTrue: [ 
			velocidad:=  velocidad - 10.
			 ].
		 ].

]

{ #category : 'as yet unclassified' }
Vehiculo >> moverIzquierda [


(posicionX > (ruta limiteIzquierdo) ) ifTrue: [ 
	posicionX:= posicionX - 10.	
	 ]
	ifFalse: [ 
		(velocidad > 10) ifTrue: [ 
			velocidad:=  velocidad - 10.
			 ].
		 ].

]

{ #category : 'accessing' }
Vehiculo >> posicionX [

	^posicionX.
]

{ #category : 'accessing' }
Vehiculo >> ruta: unaRuta [

ruta:= unaRuta. 

]

{ #category : 'accessing' }
Vehiculo >> velocidad [

	^velocidad.

]
