Class {
	#name : 'JuegoMorph',
	#superclass : 'Morph',
	#instVars : [
		'ruta',
		'vehiculo',
		'autoMorph',
		'rutaMorph',
		'obstaculos',
		'contadorObstaculos',
		'juego',
		'pantallaGameOver',
		'imagenGameOverOriginal'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'as yet unclassified' }
JuegoMorph >> actualizarPantallaGameOver [

	| imagenEscalada |

    pantallaGameOver ifNil: [ ^self ].
    imagenGameOverOriginal ifNil: [ ^self ].

    imagenEscalada := imagenGameOverOriginal
        scaledToExactSize: self extent.

    pantallaGameOver image: imagenEscalada.
    pantallaGameOver position: self topLeft.
]

{ #category : 'as yet unclassified' }
JuegoMorph >> agregarObstaculo: unObstaculo conImagen: rutaImagen [
    | obstaculoVisual |

   obstaculoVisual := ObstaculoMorph new.

   obstaculoVisual obstaculo: unObstaculo.
   obstaculoVisual cargarImagen: rutaImagen.

   self addMorphFront: obstaculoVisual.

   obstaculos add: obstaculoVisual.  
	
	obstaculoVisual actualizarRepresentacion.
]

{ #category : 'as yet unclassified' }
JuegoMorph >> clickGameOver: unEvento [

	|punto x y |
	
	punto:= unEvento position - pantallaGameOver position.
	
	x:= punto x * 1640 / pantallaGameOver width.
	y:= punto y * 959 / pantallaGameOver height.
	
	"boton REINTENTAR"
	((x between: 470 and: 1160) and: [ y between: 500 and: 640]) ifTrue: [ 
		self reintentar.
		^self
		 ].
	
	"boton Menu Principal"
	((x between: 470 and: 1160) and: [y between: 645 and: 785]) ifTrue: [ 
		self volverAlMenu.
		^self.
		 ].
]

{ #category : 'as yet unclassified' }
JuegoMorph >> eliminarObstaculos [

	|paraEliminar|
	
	paraEliminar:= obstaculos select: [:visual|
		(visual obstaculo activo not) or: [ visual top > self bottom ]
		].
	
		paraEliminar do: [ :visual|
			
			"Eliminar el objeto del dominio"
			juego eliminarObstaculos: visual obstaculo.
			
			"Eliminar su representación gráfica"
			visual delete.
			
			"Eliminarlo de la colección de Morphs"
			obstaculos remove: visual.
			
			 ].
]

{ #category : 'geometry' }
JuegoMorph >> extent: unPunto [

    " Actualizamos el tamaño físico de la ventana"
    super extent: unPunto.
    

   rutaMorph ifNotNil: [
       rutaMorph bounds: self bounds.
    ].
    

    autoMorph ifNotNil: [
       autoMorph escalarEn: self width.

       autoMorph position: autoMorph position x @ (self position y + self height - autoMorph height - 7).
    ].

	self actualizarPantallaGameOver.
]

{ #category : 'as yet unclassified' }
JuegoMorph >> generarObstaculo [

	| obs tipoImagen |

	obs:= juego generarObstaculo.
	
	tipoImagen:= (obs isKindOf: AutoObstaculo) "identifica qué imagen corresponde:"
		ifTrue: [ 
			2
			]
		ifFalse: [ 
			1
			].
		
	self agregarObstaculo: obs conImagen: tipoImagen.
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
	contadorObstaculos:= 0.

"2. Al definir el tamaño inicial"
	self extent: 1280@720.
	
	rutaMorph extent: self extent.
]

{ #category : 'accessing' }
JuegoMorph >> juego: unJuego [

	juego:= unJuego.
	
	self ruta: juego ruta.
	self vehiculo: juego vehiculo.
]

{ #category : 'event handling' }
JuegoMorph >> keyDown: evento [

|tecla|

	(juego isNil or: [ juego estaJugando not]) ifTrue: [ 
			^self.
		 ].

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

{ #category : 'as yet unclassified' }
JuegoMorph >> mostrarGameOver [

    pantallaGameOver ifNotNil: [ ^self ].
	
	imagenGameOverOriginal := Form fromFileNamed: (FileLocator workingDirectory / 'imagenes' / 'gameover.png') fullName.
	
	pantallaGameOver:= ImageMorph new.
	
	pantallaGameOver image: imagenGameOverOriginal.
	
	self addMorphFront: pantallaGameOver.
	
	self actualizarPantallaGameOver.
	
	pantallaGameOver on: #mouseDown send: #clickGameOver: to: self.
]

{ #category : 'event handling' }
JuegoMorph >> mouseEnter: evento [
    evento hand newKeyboardFocus: self.

]

{ #category : 'as yet unclassified' }
JuegoMorph >> reintentar [

|nuevoJuego nuevaVista|

	self stopStepping.
	
	nuevoJuego:= Juego new.
	
	nuevaVista:= self class new.
	nuevaVista juego: nuevoJuego.
	nuevaVista  openInWindow.
	

	self owner ifNotNil: [ :ventana|
			ventana delete.
		 ].
]

{ #category : 'accessing' }
JuegoMorph >> ruta: unaRuta [
   ruta := unaRuta.
   rutaMorph ruta: unaRuta.

]

{ #category : 'stepping and presenter' }
JuegoMorph >> step [ 

	"(juego isNil or: [ ruta isNil or: [ vehiculo isNil ] ])
    	ifTrue: [ ^self ]."
	
	juego estaJugando ifFalse: [ 
		self mostrarGameOver.
		self stopStepping.
		^self
		 ].
	
	juego actualizar.
	
	autoMorph actualizarPosicion.
	
	obstaculos do: [ :visual |
    visual actualizarRepresentacion.
].
	
	"generar obs"
	contadorObstaculos := contadorObstaculos +1.
	
	contadorObstaculos >= 60 ifTrue: [ 
		self generarObstaculo.
		contadorObstaculos:= 0.		
		 ].
	
	self verificarColisiones.
	self eliminarObstaculos.
	
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

{ #category : 'as yet unclassified' }
JuegoMorph >> verificarColisiones [

	obstaculos do: [ :visual|
		(visual obstaculo activo and: [autoMorph bounds intersects: visual bounds] ) ifTrue: [ 
			juego procesarColisionCon: visual obstaculo.
			 ].
		 ].
]

{ #category : 'as yet unclassified' }
JuegoMorph >> volverAlMenu [

| menu |

	self stopStepping.
	
	menu:= MenuPrincipalMorph new.
	menu openInWindow.
	
	self owner ifNotNil: [ :ventana |
			ventana delete.
		 ].
]
