extends Node2D

var ppp = load("res://line_punkt.tscn") as PackedScene

var wcisniety_ppm = false
var przeciagany_wezel:punkt = null
var margines_selekcji = 20

func tworz_linie(poczatek_lini:Vector2, odstep:float, ile_wezlow:int):
	var poprzedni_punkt: punkt
	for i in range(ile_wezlow):
		var nowy_punkt = ppp.instantiate()
		nowy_punkt.transform.origin = Vector2(0, i * odstep) + poczatek_lini
		add_child(nowy_punkt)
		if i > 0:
			nowy_punkt.dodaj_sasiada(poprzedni_punkt)
			poprzedni_punkt.dodaj_sasiada(nowy_punkt)
		else:
			nowy_punkt.is_static = true
		poprzedni_punkt = nowy_punkt

# Called when the node enters the scene tree for the first time.
func _ready():
	tworz_linie(Vector2(100, 100), 20, 15)

func _physics_process(delta):
	for child in get_children():
		if !child.is_static:
			child.licz_sile()
			
	for child in get_children():
		if !child.is_static:
			child.symplekt_euler(delta)

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			wcisniety_ppm = true
			przeciagany_wezel = null
			for node in get_children():
				if event.position.distance_to(node.position) < margines_selekcji:
					przeciagany_wezel = node
		else:
			wcisniety_ppm = false
			przeciagany_wezel = null

func _process(delta):
	if wcisniety_ppm:
		if przeciagany_wezel != null:
			przeciagany_wezel.position = get_global_mouse_position()
