"
Es la clase encargada de representar gráficamente la carretera del juego.

Su responsabilidad es dibujar la ruta, mostrar su desplazamiento y adaptar la representación a las dimensiones de la ventana.

Utiliza la información proporcionada por el modelo Ruta para representar visualmente el avance del vehículo.

Permite mantener separada la lógica de la carretera de su presentación gráfica.
"
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
    imagenRuta extent ~= self extent ifTrue: [


        "Garantizar que la escala se base en la altura"
        imagenRuta := imagenOriginal scaledToExactSize: self extent.

"scaledToSize: ((imagenOriginal width * self height / imagenOriginal height) rounded @ self height)."
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
