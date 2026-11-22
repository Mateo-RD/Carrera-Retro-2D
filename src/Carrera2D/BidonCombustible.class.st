"
Representa un objeto de recarga de combustible que puede ser recogido por el jugador durante la carrera.

Hereda de Obstaculo las características comunes necesarias para aparecer y desplazarse sobre la carretera.

Su responsabilidad es recuperar una cantidad determinada de combustible del vehículo cuando se produce una colisión.

A diferencia de los obstáculos perjudiciales, no provoca la pérdida de vidas. Una vez recogido, queda desactivado para evitar que se utilice nuevamente.

"
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
