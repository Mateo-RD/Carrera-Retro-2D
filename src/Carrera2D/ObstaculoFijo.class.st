"
Representa un obstáculo fijo que aparece sobre la carretera y que el jugador debe esquivar.

Hereda de Obstaculo las propiedades relacionadas con la posición, dimensiones, carril y estado activo.

Su responsabilidad es representar los obstáculos que no poseen movimiento propio, pero que se desplazan visualmente respecto del vehículo debido al avance de la carrera.

Cuando el jugador colisiona con uno de estos obstáculos, pierde una vida.
"
Class {
	#name : 'ObstaculoFijo',
	#superclass : 'Obstaculo',
	#instVars : [
		'tipo'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'initialization' }
ObstaculoFijo >> initialize [
    super initialize.
    tipo := #cono.
]

{ #category : 'accessing' }
ObstaculoFijo >> tipo [
    ^tipo
]

{ #category : 'accessing' }
ObstaculoFijo >> tipo: unTipo [
    tipo := unTipo
]
