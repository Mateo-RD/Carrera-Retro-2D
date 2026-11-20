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
