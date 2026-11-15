Class {
	#name : 'JuegoMorph',
	#superclass : 'Morph',
	#instVars : [
		'ruta',
		'vehiculo',
		'autoMorph',
		'rutaMorph',
		'obstaculos'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'geometry' }
JuegoMorph >> extent: unPunto [

    " Actualizamos el tamaño físico de la ventana"
    super extent: unPunto.
    

   rutaMorph ifNotNil: [
       rutaMorph bounds: self bounds.
    ].
    

    autoMorph ifNotNil: [
       autoMorph escalarEn: self width.

       autoMorph position:
           autoMorph position x @
           (self position y + self height - autoMorph height - 7).
    ].
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
	
	rutaMorph := RutaMorph new.
   self addMorphBack: rutaMorph.

	autoMorph := AutoMorph new.
   self addMorphFront: autoMorph.

	obstaculos := OrderedCollection new.

"2. Al definir el tamaño inicial"
	self extent: 1280@720.
	
	rutaMorph extent: self extent.
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
JuegoMorph >> ruta: unaRuta [
   ruta := unaRuta.
   rutaMorph ruta: unaRuta.

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
