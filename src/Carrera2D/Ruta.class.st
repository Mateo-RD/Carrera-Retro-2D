"
Representa la carretera por la que se desplaza el vehículo durante la partida.

Administra los límites horizontales de la ruta y el desplazamiento de las líneas de la carretera.

Su responsabilidad es proporcionar los límites necesarios para el movimiento del vehículo y actualizar el desplazamiento de la carretera en función de la velocidad del jugador.

La representación visual de la ruta se encuentra separada en la clase RutaMorph.
"
Class {
	#name : 'Ruta',
	#superclass : 'Object',
	#instVars : [
		'limiteIzquierdo',
		'limiteDerecho',
		'desplazamientoLineas'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'as yet unclassified' }
Ruta >> actualizarDes: velocidad [

desplazamientoLineas:= desplazamientoLineas + velocidad.

]

{ #category : 'as yet unclassified' }
Ruta >> actualizarLimitesSegun: anchoVentana [
    | factor limite|

    factor := anchoVentana / 1270.

	 limite := 60 + ((factor - 1) * 15).

    limiteIzquierdo := 0 - limite.
    limiteDerecho := limite.
]

{ #category : 'accessing' }
Ruta >> desplazamientoLineas [

^desplazamientoLineas.

]

{ #category : 'initialization' }
Ruta >> initialize [ 

limiteIzquierdo:= -60.
limiteDerecho:= 60.	
desplazamientoLineas:= 0.

]

{ #category : 'accessing' }
Ruta >> limiteDerecho [

^limiteDerecho .

]

{ #category : 'accessing' }
Ruta >> limiteIzquierdo [


^limiteIzquierdo.

]
