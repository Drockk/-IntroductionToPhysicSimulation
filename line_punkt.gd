class_name punkt
extends Node2D

var is_static = false
var sasiedzi:Array = []
var odleglosci_rownowagowe:Array = []

var predkosc = Vector2(0.0, 0.0)
var sila = Vector2(0.0, 0.0)
var grawitacja = Vector2(0.0, 300.0)
var sprezystosc: float = 500.0

func dodaj_sasiada(pp):
	sasiedzi.append(pp)
	odleglosci_rownowagowe.append((pp.position - position).length())
	
func licz_sile():
	sila = Vector2()
	for i in range(sasiedzi.size()):
		var wektor_rozsuniecia = sasiedzi[i].position - position
		var rozciagniecie = wektor_rozsuniecia.length() - odleglosci_rownowagowe[i]
		
		if rozciagniecie > 0:
			var kierunek_rozsuniecia = wektor_rozsuniecia.normalized()
			sila += sprezystosc * rozciagniecie * kierunek_rozsuniecia
			
	sila += grawitacja
	sila -= predkosc

func symplekt_euler(delta):
	predkosc += sila * delta
	position += predkosc * delta

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
