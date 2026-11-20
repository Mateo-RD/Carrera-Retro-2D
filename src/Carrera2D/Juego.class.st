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

{ #category : 'accessing' }
Juego >> ruta [

	^ruta.
]

{ #category : 'accessing' }
Juego >> vehiculo [

	^vehiculo .
]
