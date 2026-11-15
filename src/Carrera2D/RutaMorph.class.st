Class {
	#name : 'RutaMorph',
	#superclass : 'Morph',
	#instVars : [
		'ruta',
		'imagenOriginal',
		'imagenRuta'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'geometry' }
RutaMorph >> bounds: unRectangulo [
    super bounds: unRectangulo.

    imagenOriginal ifNotNil: [
        imagenRuta := imagenOriginal scaledToSize: self extent.
        self changed.
    ].
]

{ #category : 'drawing' }
RutaMorph >> drawOn: dibujo [
    | desplazamiento |

   super drawOn: dibujo.

   ruta ifNil: [ ^self ].

   desplazamiento := ruta desplazamientoLineas \\ imagenRuta height.


   dibujo drawImage: imagenRuta
       at: self bounds origin + (0 @ desplazamiento).

   dibujo drawImage: imagenRuta
       at: self bounds origin +
           (0 @ (desplazamiento - imagenRuta height)).
]

{ #category : 'geometry' }
RutaMorph >> extent: unPunto [
    super extent: unPunto.

    imagenOriginal ifNotNil: [
        imagenRuta := imagenOriginal scaledToSize: unPunto.
    ].

    self changed.
]

{ #category : 'initialization' }
RutaMorph >> initialize [
   super initialize.

   self color: Color transparent.

   imagenOriginal := Form fromFileNamed: 'C:\Carrera2D\ruta2.png'.

   imagenRuta := imagenOriginal.
]

{ #category : 'accessing' }
RutaMorph >> ruta: unaRuta [
    ruta := unaRuta.
]

{ #category : 'as yet unclassified' }
RutaMorph >> tamanoImagen [
    ^imagenRuta extent.
]
