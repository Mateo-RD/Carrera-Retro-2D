Class {
	#name : 'HUDMorph',
	#superclass : 'Morph',
	#instVars : [
		'juego',
		'textoVidas',
		'imagenCorazonRojo',
		'imagenCorazonGris',
		'corazones',
		'iconoCombustible',
		'barraFondo',
		'barraCombustible',
		'iconoReloj',
		'textoTiempo'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'as yet unclassified' }
HUDMorph >> actualizar [

   juego ifNil: [ ^self ].

   self actualizarVidas.
	self actualizarCombustible.
	self actualizarTiempo.
]

{ #category : 'as yet unclassified' }
HUDMorph >> actualizarCombustible [
 | porcentaje ancho |

	juego ifNil: [ ^self ].

	porcentaje := juego vehiculo combustible.

	ancho := ((porcentaje / 100) * 160) rounded.

	barraCombustible extent: ancho@20.
	
	(porcentaje <= 25) ifTrue: [ 
		barraCombustible color: Color red.
		 ]
		ifFalse: [ 
			(porcentaje <= 50) ifTrue: [ 
				barraCombustible color: Color yellow.
				 ]
				ifFalse: [ 
					barraCombustible color: Color green.
					 ].
			 ]	.
]

{ #category : 'as yet unclassified' }
HUDMorph >> actualizarTiempo [

	| segundosRestantes minutos segundos texto |

	juego ifNil: [ ^self ].

	segundosRestantes := juego tiempoRestante ceiling.

	minutos := segundosRestantes // 60.
	segundos := segundosRestantes \\ 60.

	texto := minutos asString padLeftTo: 2 with: $0.
	texto := texto, ':'.
	texto := texto, (segundos asString padLeftTo: 2 with: $0).

	textoTiempo contents: texto.
]

{ #category : 'as yet unclassified' }
HUDMorph >> actualizarVidas [

    | vidasRestantes |

    juego ifNil: [ ^self ].

    vidasRestantes := juego vehiculo vida.

    1 to: (corazones size) do: [ :indice |
        | imagen |

        imagen := (indice <= vidasRestantes)
            ifTrue: [ imagenCorazonRojo ]
            ifFalse: [ imagenCorazonGris ].

        (corazones at: indice) image: (imagen scaledToExactSize: 32@32).
    ].
]

{ #category : 'as yet unclassified' }
HUDMorph >> inicializarCombustible [

|imagen|
	
	imagen:= Form fromFileNamed: (FileLocator  workingDirectory / 'imagenes' / 'combustibleHUD.png') fullName.
	
	iconoCombustible := ImageMorph new.
	iconoCombustible image: (imagen scaledToExactSize: 40@40).
	
	self addMorph: iconoCombustible.
	iconoCombustible  position: self topLeft + (10@55).
	
	barraFondo:= Morph new.
	barraFondo color: Color darkGray.
	barraFondo extent: 160@ 20.
	
	self addMorph: barraFondo.
	barraFondo position: self topLeft + (60@65).
	
	barraCombustible:= Morph new.
	barraCombustible color: Color green.
	barraCombustible extent: 160@20.
	
	self addMorphFront: barraCombustible.
	barraCombustible position: barraFondo position.

]

{ #category : 'as yet unclassified' }
HUDMorph >> inicializarTiempo [
	|imagen|
	
	imagen:= Form fromFileNamed: (FileLocator workingDirectory / 'imagenes' / 'relojHUD.png') fullName.
	
	iconoReloj:= ImageMorph new.
	iconoReloj image: (imagen scaledToExactSize: 40@40).
	
	self addMorph: iconoReloj.
	iconoReloj position: self topLeft + (10@105).
	
	textoTiempo:= StringMorph new.
	textoTiempo contents: '02:00'.
	textoTiempo color: Color white.
	textoTiempo font: (LogicalFont familyName: 'Arial' pointSize: 24).

	self addMorph: textoTiempo.
	textoTiempo position: self topLeft + (60@110).
]

{ #category : 'initialization' }
HUDMorph >> initialize [

	super initialize.
	self color: Color transparent.
	
	imagenCorazonRojo := Form fromFileNamed:
	(FileLocator workingDirectory / 'imagenes' / 'corazonrojo.png') fullName.

	imagenCorazonGris := Form fromFileNamed:
	(FileLocator workingDirectory / 'imagenes' / 'corazongris.png') fullName.

	corazones := OrderedCollection new.

	1 to: 3 do: [ :indice |
    | corazon |

    corazon := ImageMorph new.
    corazon image: (imagenCorazonRojo scaledToExactSize: 32@32).

    self addMorph: corazon.

    corazon position:
        self topLeft + ((10 + ((indice - 1) * 38)) @ 10).

    corazones add: corazon.
].

	self extent: 250@110.
	self inicializarCombustible.
	self inicializarTiempo.
]

{ #category : 'accessing' }
HUDMorph >> juego: unJuego [

	juego := unJuego.
	self actualizar.

]
