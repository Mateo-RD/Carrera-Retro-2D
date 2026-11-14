Class {
	#name : 'JuegoMorph',
	#superclass : 'Morph',
	#instVars : [
		'ruta',
		'vehiculo',
		'autoMorph',
		'imagenRuta'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'drawing' }
JuegoMorph >> drawOn: unCanvas [
    | desplazamiento posicionX |

    desplazamiento := ruta desplazamientoLineas \\ imagenRuta height.

    posicionX := (self width - imagenRuta width) / 2.

    unCanvas drawImage: imagenRuta at: self position + (posicionX@desplazamiento).

    unCanvas drawImage: imagenRuta at: self position + (posicionX@(desplazamiento - imagenRuta height)).
]

{ #category : 'geometry' }
JuegoMorph >> extent: unPunto [
    | anchoImagen altoImagen |
    
    " Actualizamos el tamaño físico de la ventana"
    super extent: unPunto.
    
    " Seguro por si Pharo llama a esto antes de que termine el initialize"
    (imagenRuta isNil or: [ autoMorph isNil ]) ifTrue: [ ^ self ].
    
    " Recalculamos la textura al tamaño actual"
    anchoImagen := self width. 
    altoImagen := self height.
    imagenRuta := imagenRuta scaledToSize: anchoImagen @ altoImagen.
    
	"obligamos al auto a escalarse a la nueva proporcion"
	autoMorph escalarEn: anchoImagen.
	

	" Posicionamos el auto abajo (dinámico según su nuevo tamaño)"
    autoMorph position: autoMorph position x @ (self position y + self height - autoMorph height - 7).
]

{ #category : 'event handling' }
JuegoMorph >> handlesKeyboard: evento [

"Esto le indica a Pharo que nuestro Morph puede recibir eventos de teclado."
	^true.

]

{ #category : 'event handling' }
JuegoMorph >> handlesMouseOver: evento [
    ^ true

]

{ #category : 'initialization' }
JuegoMorph >> initialize [ 
	
	super initialize.

	"1. Cargamos las cosas a la memoria UNA sola vez"
	imagenRuta:= Form fromFileNamed: 'C:\Carrera2D\ruta2.png'.
	autoMorph:= AutoMorph new.
	self addMorph: autoMorph.
	
"2. Al definir el tamaño inicial, Pharo llamará automáticamente al método extent: que crearemos abajo"
	self extent: 1280@720.
]

{ #category : 'event handling' }
JuegoMorph >> keyDown: evento [

|tecla|

"recibo el evento por teclado."
	tecla:= evento keyValue.
	
"comparo que es y en base a eso le asigno una funcion determinada del vehiculo."
	tecla = 31 ifTrue: [ 
		vehiculo frenar.
		 ].
	
	tecla = 30  ifTrue: [ 
		vehiculo acelerar .
		 ].
	
	tecla = 28 ifTrue: [ 
		vehiculo moverIzquierda .
		 ].
	
	tecla = 29  ifTrue: [ 
		vehiculo moverDerecha.
		 ].
	
	autoMorph actualizarPosicion.
	self changed.

]

{ #category : 'event handling' }
JuegoMorph >> mouseEnter: evento [
    evento hand newKeyboardFocus: self.

]

{ #category : 'accessing' }
JuegoMorph >> ruta: rut [ 

	ruta:= rut.

]

{ #category : 'stepping and presenter' }
JuegoMorph >> step [ 

	ruta actualizarDes: vehiculo velocidad.
	autoMorph actualizarPosicion.
	self changed.

]

{ #category : 'stepping and presenter' }
JuegoMorph >> stepTime [ 
^50.

"despues probar con 75"

]

{ #category : 'accessing' }
JuegoMorph >> vehiculo: vehi [

	vehiculo:= vehi.
	autoMorph vehiculo: vehi.
	autoMorph  actualizarPosicion.

]
