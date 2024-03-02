extends Node3D

var box;
var slider1;
var V = 0;
var V_max;
var angle = 0;

var rotAxis = Vector3(1, 1, 0).normalized()

func own_rotate(obj, point, axis, angle):
	var rot = angle + obj.rotation.y
	var transform_start = point
	obj.global_translate(-transform_start)
	obj.transform = obj.transform.rotated(axis, -rot)
	obj.global_translate(transform_start)

# Called when the node enters the scene tree for the first time.
func _ready():
	box = get_node("box")
	slider1 = get_node("slider1")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	V_max = slider1.value * 0.001
	if V < V_max:
		V += 0.00015
	if V > V_max:
		V -= 0.00015
	
func _physics_process(delta):
	angle += delta
	own_rotate(box, Vector3(1, 1, 2), Vector3(1, 1, 0).normalized(), angle)
