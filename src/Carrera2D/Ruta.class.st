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
