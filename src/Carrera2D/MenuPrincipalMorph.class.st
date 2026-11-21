Class {
	#name : 'MenuPrincipalMorph',
	#superclass : 'Morph',
	#instVars : [
		'juego'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'geometry' }
MenuPrincipalMorph >> extent: unTamano [
    | fondo imagen ancho alto |

    super extent: unTamano.
    self submorphs ifEmpty: [ ^ self ].

    fondo := self submorphs first.

    ancho := unTamano x - 30.
    alto := unTamano y.

    imagen := JPEGReadWriter formFromFileNamed:
        (FileLocator workingDirectory / 'imagenes' / 'menu.jpeg') fullName.

    fondo image: (imagen scaledToSize: ancho @ alto).
	 fondo position: 300@50.
]

{ #category : 'initialization' }
MenuPrincipalMorph >> iniciarJuego [
    | ruta vehiculo juegoMorph |

    ruta := Ruta new.
    vehiculo := Vehiculo new.
    vehiculo ruta: ruta.

    juegoMorph := JuegoMorph new.
    juegoMorph ruta: ruta.
    juegoMorph vehiculo: vehiculo.

    juegoMorph openInWindow.
    juegoMorph startStepping.

    self delete.
]

{ #category : 'initialization' }
MenuPrincipalMorph >> initialize [
    | fondo imagen |

    super initialize.
    self extent: 1200@803.
    self color: Color black.

    imagen := JPEGReadWriter formFromFileNamed:
        (FileLocator workingDirectory / 'imagenes' / 'menu.jpeg') fullName.

    fondo := ImageMorph new.
    fondo image: (imagen scaledToSize: 1200@803).
    fondo position: 0@0.

    self addMorph: fondo.
    fondo on: #mouseDown send: #mouseDown: to: self.
]

{ #category : 'as yet unclassified' }
MenuPrincipalMorph >> mostrarControles [
    | pantalla fondo titulo instrucciones volver |

    pantalla := Morph new.
    pantalla extent: self extent.
    pantalla color: (Color r: 0.08 g: 0.12 b: 0.16).
    pantalla position: self position.

	 fondo := ImageMorph new.
	 fondo image: (PNGReadWriter formFromFileNamed:
    (FileLocator workingDirectory / 'imagenes' / 'menuNuevo.png') fullName).
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
    | pantalla fondo volver |

    pantalla := Morph new.
    pantalla extent: 800@600.
    pantalla color: Color black.
    pantalla position: self position.

    fondo := ImageMorph new.
    fondo image: ((PNGReadWriter formFromFileNamed:
        (FileLocator workingDirectory / 'imagenes' / 'creditos.png') fullName)
        scaledToSize: 800@600).
    fondo position: pantalla position.
    pantalla addMorph: fondo.

    volver := Morph new.
    volver extent: 230@55.
    volver position: pantalla position + (285@440).
    volver color: Color transparent.
    volver borderWidth: 0.
    volver on: #mouseUp send: #delete to: pantalla.
    pantalla addMorph: volver.

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
