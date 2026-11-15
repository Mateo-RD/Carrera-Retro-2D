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
