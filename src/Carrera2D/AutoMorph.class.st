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
    self position:
        (((self owner width - self width) / 2
        + vehiculo posicionX) rounded)
        @ (self owner height - self height - 20).
]

{ #category : 'drawing' }
AutoMorph >> drawOn: carro [

	super drawOn: carro.
	carro drawImage: auto at: self position.
]

{ #category : 'initialization' }
AutoMorph >> initialize [

	super initialize.
	self color: Color transparent.
	auto:= (Form fromFileNamed: 'C:\Carrera2D\auto.png') scaledToSize: 200@250.
	self extent: 200@250.

]

{ #category : 'accessing' }
AutoMorph >> vehiculo: vehi [.

	vehiculo:= vehi.
]
