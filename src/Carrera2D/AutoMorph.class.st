"
Es la representación gráfica del vehículo controlado por el jugador.

Su responsabilidad es dibujar el vehículo en pantalla, actualizar su posición visual y adaptar su tamaño a las dimensiones de la ventana.

Se relaciona con la clase Vehiculo, de la cual obtiene la información necesaria para representar su estado.

No administra las reglas de movimiento ni la velocidad del vehículo, ya que esas responsabilidades pertenecen al modelo.
"
Class {
	#name : 'AutoMorph',
	#superclass : 'Morph',
	#instVars : [
		'auto',
		'vehiculo',
		'imagenOriginal'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'as yet unclassified' }
AutoMorph >> actualizarPosicion [

    | factor posicionVisualX centroVisualX |

    factor := self owner width / 1200.

    posicionVisualX := (vehiculo posicionX * factor) rounded.

    centroVisualX := (self owner width / 2) - (self width / 2).
    self position: (vehiculo posicionX + centroVisualX + posicionVisualX + self owner position x - 10) @self  position y.



]

{ #category : 'drawing' }
AutoMorph >> drawOn: carro [

	super drawOn: carro.
	carro translucentImage: auto at: self position.
]

{ #category : 'as yet unclassified' }
AutoMorph >> escalarEn: anchoVentana [

| factor nuevoAncho nuevoAlto|

	factor:= anchoVentana /1200.
	
	nuevoAncho:= (imagenOriginal width * factor) rounded.
	nuevoAlto:= (imagenOriginal height * factor) rounded.
	
	auto:= imagenOriginal scaledToSize: nuevoAncho@nuevoAlto.
	
	self extent: nuevoAncho @ nuevoAlto. 
]

{ #category : 'initialization' }
AutoMorph >> initialize [

	super initialize.
	
	vehiculo := Vehiculo new.
	self color: Color transparent.
	imagenOriginal := (Form fromFileNamed: (FileLocator workingDirectory / 'imagenes' / 'auto.png')) scaledToSize: 100@150.
	
	auto := imagenOriginal.


"La variable 'auto' es la que usa el método drawOn: para estampar"
]

{ #category : 'accessing' }
AutoMorph >> vehiculo: vehi [.

	vehiculo:= vehi.
]
