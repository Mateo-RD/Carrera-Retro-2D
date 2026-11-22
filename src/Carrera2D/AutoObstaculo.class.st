"
Representa un vehículo enemigo que aparece como obstáculo durante la carrera.

Hereda las características comunes de Obstaculo e incorpora una velocidad propia.

Su responsabilidad es definir un comportamiento de desplazamiento diferente al de los obstáculos fijos, teniendo en cuenta tanto su velocidad como la del vehículo del jugador.

Cuando el jugador colisiona con este objeto, pierde una vida.
"
Class {
	#name : 'AutoObstaculo',
	#superclass : 'Obstaculo',
	#instVars : [
		'velocidad'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'as yet unclassified' }
AutoObstaculo >> avanzarRespectoA: velocidadJugador [
    self avanzar: (velocidadJugador - velocidad).
]

{ #category : 'initialization' }
AutoObstaculo >> initialize [
    super initialize.
    velocidad := 0.
]

{ #category : 'as yet unclassified' }
AutoObstaculo >> porcentajeAltura [

	^0.20.
]

{ #category : 'accessing' }
AutoObstaculo >> velocidad [
    ^velocidad
]

{ #category : 'accessing' }
AutoObstaculo >> velocidad: unaVelocidad [
    velocidad := unaVelocidad
]
