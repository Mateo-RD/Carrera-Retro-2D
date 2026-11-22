Class {
	#name : 'MenuPrincipalMorph',
	#superclass : 'Morph',
	#instVars : [
		'juego',
		'fondoMorph'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'geometry' }
MenuPrincipalMorph >> extent: unTamano [
    | imagen ancho alto |

    super extent: unTamano.
    self submorphs ifEmpty: [ ^ self ].

    ancho := unTamano x - 30.
    alto := unTamano y.

    imagen := Form fromFileNamed:
        (FileLocator workingDirectory / 'imagenes' / 'menu.jpeg') fullName.


"En Morphic, extent: puede ejecutarse durante la inicialización, antes de que exista fondoMorph. Por eso utilizamos: ifNotNil"
    fondoMorph ifNotNil: [
    	fondoMorph image: (imagen scaledToExactSize: self extent).
    	fondoMorph position: self topLeft.
		].
]

{ #category : 'initialization' }
MenuPrincipalMorph >> iniciarJuego [ 
	| nuevoJuego juegoVisual|
	
	nuevoJuego:= Juego new.
	
	juegoVisual:= JuegoMorph new.
	juegoVisual juego: nuevoJuego.
	
	juegoVisual openInWindow.
	
	self owner ifNotNil: [ :ventana|
		ventana delete
		 ].
]

{ #category : 'initialization' }
MenuPrincipalMorph >> initialize [
    | imagen |

    super initialize.
    self extent: 1200@803.
    self color: Color black.

    imagen := Form fromFileNamed:
        (FileLocator workingDirectory / 'imagenes' / 'menu.jpeg') fullName.

    fondoMorph := ImageMorph new.
    fondoMorph image: (imagen scaledToSize: 1200@803).
    fondoMorph position: 0@0.

    self addMorph: fondoMorph.
    fondoMorph on: #mouseDown send: #mouseDown: to: self.
]

{ #category : 'as yet unclassified' }
MenuPrincipalMorph >> mostrarControles [
    | pantalla fondo titulo instrucciones volver |

    pantalla := Morph new.
    pantalla extent: self extent.
    pantalla color: (Color r: 0.08 g: 0.12 b: 0.16).
    pantalla position: self position.

	 fondo := ImageMorph new.
	 fondo image:   (Form fromFileNamed:
    (FileLocator workingDirectory / 'imagenes' / 'ruta1.png') fullName).
	 fondo extent: pantalla extent.
 	 fondo position: pantalla position.
	 pantalla addMorph: fondo.

    titulo := StringMorph new.
    titulo contents: 'COMO JUGAR'.
    titulo color: Color yellow.
    titulo font: (LogicalFont familyName: 'Arial' pointSize: 30).
    titulo position: pantalla position + (270@100).
    pantalla addMorph: titulo.

    instrucciones := StringMorph new.
	 instrucciones contents: 'FLECHA IZQUIERDA: mover a la izquierda'.
	 instrucciones color: Color white.
	 instrucciones font: (LogicalFont familyName: 'Arial' pointSize: 20).
	 instrucciones position: pantalla position + (230@220).
	 pantalla addMorph: instrucciones.

	 instrucciones := StringMorph new.
	 instrucciones contents: 'FLECHA DERECHA: mover a la derecha'.
	 instrucciones color: Color white.
	 instrucciones font: (LogicalFont familyName: 'Arial' pointSize: 20).
	 instrucciones position: pantalla position + (230@260).
	 pantalla addMorph: instrucciones.

    instrucciones := StringMorph new.
  	 instrucciones contents: 'ESQUIVA LOS OBSTACULOS'.
 	 instrucciones color: Color yellow.
	 instrucciones font: (LogicalFont familyName: 'Arial' pointSize: 20).
	 instrucciones position: pantalla position + (290@310).
	 pantalla addMorph: instrucciones.

    volver := SimpleButtonMorph new.
    volver label: 'VOLVER'.
    volver extent: 200@50.
    volver position: pantalla position + (300@420).
    volver target: pantalla.
    volver actionSelector: #delete.
    pantalla addMorph: volver.

    self addMorphFront: pantalla.
]

{ #category : 'as yet unclassified' }
MenuPrincipalMorph >> mostrarCreditos [
    | pantalla fondo imagen volver menu tamano relleno |

    menu := self submorphs first.
    tamano := self extent.

    pantalla := Morph new.
    pantalla color: Color transparent.
    pantalla borderWidth: 0.
    pantalla bounds: self bounds.

    "Relleno verde para el margen derecho"
    relleno := Morph new.
    relleno color: (Color r: 0.18 g: 0.60 b: 0.08).
    relleno borderWidth: 0.
    relleno bounds: self bounds.
    pantalla addMorphBack: relleno.

    "Imagen de creditos"
    imagen := (PNGReadWriter formFromFileNamed:
        (FileLocator workingDirectory / 'imagenes' / 'creditos.png') fullName).

    fondo := ImageMorph new.
    fondo image: (imagen scaledToSize: tamano).
    fondo position: self position.
    pantalla addMorphFront: fondo.

    "Boton VOLVER"
    volver := Morph new.
    volver extent:
        ((tamano x * 230 / 800) @ (tamano y * 55 / 600)).
    volver position:
        self position +
        ((tamano x * 285 / 800) @ (tamano y * 440 / 600)).
    volver color: Color transparent.
    volver borderWidth: 0.

    volver on: #mouseUp send: #delete to: pantalla.
    volver on: #mouseUp send: #show to: menu.

    pantalla addMorphFront: volver.

    menu hide.
    self addMorphFront: pantalla.

]

{ #category : 'event handling' }
MenuPrincipalMorph >> mouseDown: unEvento [
    | punto x y |

    punto := unEvento position - self position.

    x := punto x * 779 / self width.
    y := punto y * 521 / self height.

    "JUGAR"
    ((x between: 270 and: 520)
        and: [ y between: 190 and: 245 ])
        ifTrue: [
            self iniciarJuego.
            ^ self
        ].

    "COMO JUGAR"
    ((x between: 270 and: 520)
        and: [ y between: 245 and: 300 ])
        ifTrue: [
            self mostrarControles.
            ^ self
        ].

    "CREDITOS"
    ((x between: 270 and: 520)
        and: [ y between: 300 and: 355 ])
        ifTrue: [
            self mostrarCreditos.
            ^ self
        ].

    "SALIR"
    ((x between: 270 and: 520)
        and: [ y between: 355 and: 410 ])
        ifTrue: [
            self delete.
            ^ self
        ].

    super mouseDown: unEvento.
]
