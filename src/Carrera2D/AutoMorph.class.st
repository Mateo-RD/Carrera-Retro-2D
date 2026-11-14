Class {
	#name : 'AutoMorph',
	#superclass : 'Morph',
	#instVars : [
		'auto',
		'vehiculo'
	],
	#category : 'Carrera2D',
	#package : 'Carrera2D'
}

{ #category : 'as yet unclassified' }
AutoMorph >> actualizarPosicion [

	| centroVisualX |
	
	
	centroVisualX := (self owner width / 2) - (self width / 2).
    self position: (vehiculo posicionX + centroVisualX + self owner position x) @self  position y.
]

{ #category : 'drawing' }
AutoMorph >> drawOn: carro [

	super drawOn: carro.
	carro drawImage: auto at: self position.
]

{ #category : 'initialization' }
AutoMorph >> initialize [

	super initialize.
	
	vehiculo := Vehiculo new.
	self color: Color transparent.
	auto = (Form fromFileNamed: 'C:\Carrera2D\auto.png') scaledToSize: 150@200.


"La variable 'auto' es la que usa el método drawOn: para estampar"
]

{ #category : 'accessing' }
AutoMorph >> vehiculo: vehi [.

	vehiculo:= vehi.
]
