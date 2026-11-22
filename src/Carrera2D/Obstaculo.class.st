"
Es la superclase de los distintos objetos que aparecen sobre la carretera.

Define las características y comportamientos comunes, como el carril, la posición vertical, las dimensiones, el estado activo y el desplazamiento.

Su responsabilidad es proporcionar una estructura reutilizable que permita especializar distintos tipos de objetos mediante herencia.

De esta clase heredan ObstaculoFijo, AutoObstaculo y BidonCombustible.
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

{ #category : 'as yet unclassified' }
Obstaculo >> avanzar: unaDistancia [
    posicionY := posicionY + unaDistancia.
]

{ #category : 'as yet unclassified' }
Obstaculo >> avanzarRespectoA: velocidadJugador [
    self avanzar: velocidadJugador.
]

{ #category : 'accessing' }
Obstaculo >> carril [

    ^carril.
]

{ #category : 'accessing' }
Obstaculo >> carril: unCarril [

	carril:= unCarril.
]

{ #category : 'as yet unclassified' }
Obstaculo >> desactivar [
    activo := false.
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

{ #category : 'as yet unclassified' }
Obstaculo >> porcentajeAltura [

	^0.10.
]

{ #category : 'accessing' }
Obstaculo >> posicionY [

	^posicionY.
]

{ #category : 'accessing' }
Obstaculo >> posicionY: unaPosicion [
    posicionY := unaPosicion.
]
