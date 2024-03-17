extends Node2D

var ppp = load("res://punkt.tscn") as PackedScene
var iter = 0

func generuj(x:int, y:int):
	var np = ppp.instantiate()
	np.transform.origin = Vector2(x, y)
	add_child(np)

# Called when the node enters the scene tree for the first time.
func _ready():
	generuj(200, 200)

func _physics_process(delta):
	iter += 1
	if iter % 5 == 0:
		generuj(200, 200)
		iter = 0
