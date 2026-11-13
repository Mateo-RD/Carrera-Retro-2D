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

    unCanvas drawImage: imagenRuta at: posicionX@desplazamiento.

    unCanvas drawImage: imagenRuta
        at: posicionX@(desplazamiento - imagenRuta height).
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

| factor imagenOriginal  anchoImagen altoImagen|
	super initialize.
	self extent: 1200@800.
	imagenOriginal := (Form fromFileNamed: 'C:\Carrera2D\ruta1.png').
	
	
	factor := self height / imagenOriginal height.
   anchoImagen := (imagenOriginal width * factor) rounded.
   altoImagen := self height.

   imagenRuta := imagenOriginal scaledToSize: anchoImagen@altoImagen.

	autoMorph:= AutoMorph new.
	self addMorph: autoMorph.
	autoMorph position:
    ((self width - autoMorph width) / 2) @ (self height - 160).
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
