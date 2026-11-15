Class {
	#name : 'ObstaculoMorph',
	#superclass : 'Morph',
	#instVars : [
		'obstaculo',
		'imagenOriginal',
		'imagen',
		'alturaContenedor'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

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
	].
]

{ #category : 'as yet unclassified' }
ObstaculoMorph >> actualizarPosicion [
    | posicionX posicionY |

    posicionY := obstaculo posicionY.

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
ObstaculoMorph >> cargarImagen: unaRuta [
    imagenOriginal := Form fromFileNamed: unaRuta.
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
