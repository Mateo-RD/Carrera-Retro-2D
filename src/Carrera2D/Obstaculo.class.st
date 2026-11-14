"
Es la clase padre de los obstaculos mas especificos. Su rol es establecer las bases (Metodos y Atributos comunes) para para luego especializarla en los obstaculos mas especificos.
"
Class {
	#name : 'Obstaculo',
	#superclass : 'Object',
	#instVars : [
		'carril',
		'posicionY',
		'ancho',
		'alto',
		'activo'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'accessing' }
Obstaculo >> activo [

	^activo.
]

{ #category : 'accessing' }
Obstaculo >> activo: unEstado [

    activo := unEstado.
]

{ #category : 'accessing' }
Obstaculo >> alto [

	^alto.
]

{ #category : 'accessing' }
Obstaculo >> alto: unAlto [

    alto := unAlto
]

{ #category : 'accessing' }
Obstaculo >> ancho [ 

	^ancho.
]

{ #category : 'accessing' }
Obstaculo >> ancho: unAncho [

    ancho := unAncho.
]

{ #category : 'accessing' }
Obstaculo >> carril [

    ^carril.
]

{ #category : 'accessing' }
Obstaculo >> carril: unCarril [

	carril:= unCarril.
]

{ #category : 'initialization' }
Obstaculo >> initialize [

	super initialize.
	carril:= 1.
	posicionY:= 0.
	ancho:= 0.
	alto:= 0.
	activo:= true.
	
"Por ahora, las dimensiones quedan en cero porque todavía no definimos el tamaño de las imágenes."
]

{ #category : 'accessing' }
Obstaculo >> posicionY [

	^posicionY.
]

{ #category : 'accessing' }
Obstaculo >> posicionY: unaPosicion [
    posicionY := unaPosicion.
]
