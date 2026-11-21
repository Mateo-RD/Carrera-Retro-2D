Class {
	#name : 'Juego',
	#superclass : 'Object',
	#instVars : [
		'ruta',
		'vehiculo',
		'obstaculos',
		'contadorObstaculos',
		'estado'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'as yet unclassified' }
Juego >> actualizar [ 

	ruta actualizarDes: vehiculo velocidad.
	
	obstaculos do: [  :obs|
			obs avanzarRespectoA: vehiculo velocidad.
		 ].
]

{ #category : 'as yet unclassified' }
Juego >> eliminarObstaculos: unObstaculo [

	obstaculos remove: unObstaculo ifAbsent: [  ].
]

{ #category : 'as yet unclassified' }
Juego >> estaJugando [

	^estado = #jugando.
]

{ #category : 'as yet unclassified' }
Juego >> generarObstaculo [

	| obs carrilAleatorio tipoAleatorio |
	carrilAleatorio := 3 atRandom.
	tipoAleatorio := 2 atRandom.

	(tipoAleatorio = 1)
   		ifTrue: [
        	obs := ObstaculoFijo new.
    	]
    	ifFalse: [
        	obs := AutoObstaculo new.
        	obs velocidad: 5 + (25 atRandom).
    	].

	obs carril: carrilAleatorio.

	"aparece por encima de la pantalla"

	obs posicionY: -100.
	obstaculos add: obs.

	^obs.
]

{ #category : 'initialization' }
Juego >> initialize [ 
	super initialize.
	
	ruta:= Ruta new.
	
	vehiculo:= Vehiculo new.
	vehiculo ruta: ruta.
	
	obstaculos:= OrderedCollection new.
	contadorObstaculos:= 0.
	
	estado:= #jugando. 
]

{ #category : 'accessing' }
Juego >> obstaculos [

	^obstaculos.
]

{ #category : 'as yet unclassified' }
Juego >> procesarColisionCon: unObstaculo [

	(self estaJugando and: [unObstaculo activo]) ifFalse: [ ^ self ].
	unObstaculo desactivar.
	
	vehiculo perderVida.
	vehiculo vida = 0 ifTrue: [ 
			estado:= #gameOver.
		 ].
]

{ #category : 'accessing' }
Juego >> ruta [

	^ruta.
]

{ #category : 'accessing' }
Juego >> vehiculo [

	^vehiculo .
]
