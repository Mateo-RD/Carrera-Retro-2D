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

{ #category : 'accessing' }
Ruta >> desplazamientoLineas [

^desplazamientoLineas.

]

{ #category : 'initialization' }
Ruta >> initialize [ 

limiteIzquierdo:= -400.
limiteDerecho:= 400.	
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
