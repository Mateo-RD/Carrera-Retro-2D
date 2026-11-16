Class {
	#name : 'RutaMorph',
	#superclass : 'Morph',
	#instVars : [
		'ruta',
		'imagenOriginal',
		'imagenRuta',
		'alturaEscalada'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'drawing' }
RutaMorph >> drawOn: dibujo [
    | desplazamiento posicionX |

    super drawOn: dibujo.

    ruta ifNil: [ ^self ].

    "Escalar solamente cuando cambia la altura"
    alturaEscalada ~= self height ifTrue: [
        imagenRuta := imagenOriginal
            scaledToSize: (self width @ self height).

        "Garantizar que la escala se base en la altura"
        imagenRuta := imagenOriginal
            scaledToSize:
                ((imagenOriginal width * self height /
                    imagenOriginal height) rounded @ self height).

        alturaEscalada := self height.
    ].

    "Centrar la imagen horizontalmente"
    posicionX := (self width - imagenRuta width) / 2.

    "Desplazamiento de la pista"
    desplazamiento := ruta desplazamientoLineas \\ imagenRuta height.

    dibujo drawImage: imagenRuta
        at: self bounds origin + (posicionX @ desplazamiento).

    dibujo drawImage: imagenRuta
        at: self bounds origin +
            (posicionX @ (desplazamiento - imagenRuta height)).
]

{ #category : 'geometry' }
RutaMorph >> extent: unPunto [
    super extent: unPunto.
    self changed.
]

{ #category : 'initialization' }
RutaMorph >> initialize [
   super initialize.



   imagenOriginal := Form fromFileNamed: (FileLocator workingDirectory / 'imagenes' / 'ruta2.png').

   imagenRuta := imagenOriginal.

	alturaEscalada := 0.
]

{ #category : 'accessing' }
RutaMorph >> ruta: unaRuta [
    ruta := unaRuta.
]

{ #category : 'as yet unclassified' }
RutaMorph >> tamanoImagen [
    ^imagenRuta extent.
]
