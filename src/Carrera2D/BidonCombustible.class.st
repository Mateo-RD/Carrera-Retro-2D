Class {
	#name : 'BidonCombustible',
	#superclass : 'Obstaculo',
	#instVars : [
		'cantidadRecarga'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'as yet unclassified' }
BidonCombustible >> aplicarA: unVehiculo [

	unVehiculo recargarCombustible: cantidadRecarga.

	activo := false.
]

{ #category : 'initialization' }
BidonCombustible >> initialize [

	super initialize.

	cantidadRecarga := 25.
]
