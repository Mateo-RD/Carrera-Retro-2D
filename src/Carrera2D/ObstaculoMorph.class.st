Class {
	#name : 'ObstaculoMorph',
	#superclass : 'Morph',
	#instVars : [
		'obstaculo',
		'imagenOriginal',
		'imagen',
		'alturaContenedor'
	],
	#classInstVars : [
		'imagenes'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'accessing' }
ObstaculoMorph class >> imagenes [

	imagenes ifNil: [ 
		imagenes:= Array new: 2.
		
		imagenes at:1 put: (Form fromFileNamed: 'C:\Carrera2D\obstaculo.png').


		imagenes at:2 put: (Form fromFileNamed: 'C:\Carrera2D\auto.png').		
		 ].
	^imagenes .
]

{ #category : 'as yet unclassified' }
ObstaculoMorph >> actualizarEscala [
    | alturaDeseada factor nuevoAncho nuevaAltura |

   
	(alturaContenedor ~= self owner height) ifTrue: [
		alturaDeseada := self owner height * 0.10.

   		factor := alturaDeseada / imagenOriginal height.

   		nuevoAncho := (imagenOriginal width * factor) rounded.
   		nuevaAltura := alturaDeseada rounded.

   		imagen := imagenOriginal scaledToSize: nuevoAncho@nuevaAltura.

   		self extent: imagen extent.
		
		alturaContenedor := self owner height.
	].
]

{ #category : 'as yet unclassified' }
ObstaculoMorph >> actualizarPosicion [
    | posicionX posicionY |

    posicionY := self owner top + obstaculo posicionY.

    posicionX := self owner center x.

    obstaculo carril = 1 ifTrue: [
        posicionX := posicionX - (self owner width * 0.25).
    ].

    obstaculo carril = 3 ifTrue: [
        posicionX := posicionX + (self owner width * 0.25).
    ].

    self position: posicionX @ posicionY.
]

{ #category : 'as yet unclassified' }
ObstaculoMorph >> actualizarRepresentacion [
   self actualizarEscala.
	self actualizarPosicion.
   self changed.
]

{ #category : 'as yet unclassified' }
ObstaculoMorph >> cargarImagen: unIndice [
    imagenOriginal := self class imagenes at: unIndice.
]

{ #category : 'drawing' }
ObstaculoMorph >> drawOn: unCanvas [
    super drawOn: unCanvas.
    imagen ifNotNil: [
        unCanvas translucentImage: imagen at: self position.
    ].
]

{ #category : 'initialization' }
ObstaculoMorph >> initialize [
    super initialize.
    self color: Color transparent.
]

{ #category : 'accessing' }
ObstaculoMorph >> obstaculo [
    ^obstaculo
]

{ #category : 'accessing' }
ObstaculoMorph >> obstaculo: unObstaculo [
    obstaculo := unObstaculo.
]
