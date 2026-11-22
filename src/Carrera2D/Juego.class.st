Class {
	#name : 'Juego',
	#superclass : 'Object',
	#instVars : [
		'ruta',
		'vehiculo',
		'obstaculos',
		'contadorObstaculos',
		'estado',
		'tiempoInicio',
		'duracionCarrera',
		'tiempoTranscurrido'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'as yet unclassified' }
Juego >> actualizar [ 

	self estaJugando ifFalse: [ ^self ].

	ruta actualizarDes: vehiculo velocidad.
	
	obstaculos do: [  :obs|
			obs avanzarRespectoA: vehiculo velocidad.
		 ].
	
	vehiculo consumirCombustible.
	
	self verificarCombustible.
	
	self actualizarTiempo.
	self verificarVictoria.
]

{ #category : 'as yet unclassified' }
Juego >> actualizarTiempo [

	tiempoTranscurrido := (Time millisecondsSince: tiempoInicio) / 1000.   "utiliza un método de Pharo que contempla el reinicio del contador."
]

{ #category : 'as yet unclassified' }
Juego >> eliminarObstaculos: unObstaculo [

	obstaculos remove: unObstaculo ifAbsent: [  ].
]

{ #category : 'as yet unclassified' }
Juego >> estaJugando [

	^ estado = #jugando
]

{ #category : 'accessing' }
Juego >> estado [ 

	^estado.
]

{ #category : 'as yet unclassified' }
Juego >> generarObstaculo [

	| obs carrilAleatorio tipoAleatorio |
	carrilAleatorio := 3 atRandom.
	tipoAleatorio := 3 atRandom.

	(tipoAleatorio = 1)
   		ifTrue: [
        	obs := BidonCombustible new.
    	]
    	ifFalse: [
			(tipoAleatorio <= 3) ifTrue: [ 
        		obs := ObstaculoFijo new.
				  ]
				  ifFalse: [
						obs := AutoObstaculo new.
        				obs velocidad: 5 + (25 atRandom). 
						 ].
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
	
	duracionCarrera := 120.
	tiempoInicio := Time millisecondClockValue.
	tiempoTranscurrido := 0.
]

{ #category : 'accessing' }
Juego >> obstaculos [

	^obstaculos.
]

{ #category : 'as yet unclassified' }
Juego >> procesarColisionCon: unObstaculo [

	(self estaJugando and: [unObstaculo activo]) ifFalse: [ ^ self ].
	
	(unObstaculo isKindOf: BidonCombustible) ifTrue: [
		unObstaculo aplicarA: vehiculo.
		^self.
	 ].
	
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

{ #category : 'as yet unclassified' }
Juego >> tiempoRestante [

	^(duracionCarrera - tiempoTranscurrido) max: 0.
]

{ #category : 'accessing' }
Juego >> vehiculo [

	^vehiculo .
]

{ #category : 'as yet unclassified' }
Juego >> verificarCombustible [

    vehiculo combustible <= 0 ifTrue: [
        estado := #gameOver.
    ].
]

{ #category : 'as yet unclassified' }
Juego >> verificarVictoria [

    (estado = #jugando and: [tiempoTranscurrido >= duracionCarrera]) ifTrue: [
        estado := #victoria.
    ].
]
