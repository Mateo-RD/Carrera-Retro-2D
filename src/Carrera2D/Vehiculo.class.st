Class {
	#name : 'Vehiculo',
	#superclass : 'Object',
	#instVars : [
		'posicionX',
		'velocidad',
		'vida',
		'ruta',
		'combustible'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'as yet unclassified' }
Vehiculo >> acelerar [

	velocidad:= (velocidad + 10) min: 80.

]

{ #category : 'accessing' }
Vehiculo >> combustible [
	^combustible.
]

{ #category : 'as yet unclassified' }
Vehiculo >> consumirCombustible [

	velocidad > 0 ifFalse: [ ^ self ].
	combustible := combustible - (velocidad * 0.001). "el vehículo pierde una cantidad proporcional a su velocidad"

	combustible := combustible max: 0
]

{ #category : 'as yet unclassified' }
Vehiculo >> frenar [


	velocidad:= (velocidad - 10) max: 10.

]

{ #category : 'initialization' }
Vehiculo >> initialize [ 

posicionX :=0.
velocidad := 10.
vida:= 3.
combustible := 100.
]

{ #category : 'as yet unclassified' }
Vehiculo >> moverDerecha [


(posicionX < (ruta limiteDerecho) ) ifTrue: [ 
	posicionX := (posicionX + 10) min: ruta limiteDerecho
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
	posicionX := (posicionX - 10) max: ruta limiteIzquierdo
	 ]
	ifFalse: [ 
		(velocidad > 10) ifTrue: [ 
			velocidad:=  velocidad - 10.
			 ].
		 ].

]

{ #category : 'as yet unclassified' }
Vehiculo >> perderVida [
    
	vida := (vida - 1)

]

{ #category : 'accessing' }
Vehiculo >> posicionX [

	^posicionX.
]

{ #category : 'accessing' }
Vehiculo >> posicionX: ejeX [

	posicionX:= ejeX 
]

{ #category : 'as yet unclassified' }
Vehiculo >> recargarCombustible: unaCantidad [

	combustible := (combustible + unaCantidad) min: 100.
]

{ #category : 'accessing' }
Vehiculo >> ruta: unaRuta [

ruta:= unaRuta. 

]

{ #category : 'accessing' }
Vehiculo >> velocidad [

	^velocidad.

]

{ #category : 'accessing' }
Vehiculo >> vida [

	^vida.
]
