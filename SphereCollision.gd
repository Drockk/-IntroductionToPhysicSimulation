extends Node3D

func norma(X):
	return sqrt(pow(X.x, 2) + pow(X.y, 2) + pow(X.z, 2))

var s1;
var s2;
var mass_reducted;
var e = 1;
var sum_of_r;

# Called when the node enters the scene tree for the first time.
func _ready():
	s1 = get_node("sphere_1");
	s2 = get_node("sphere_2");
	mass_reducted = s1.mass * s2.mass / (s1.mass + s2.mass)
	sum_of_r = s1.radius + s2.radius;

func _physics_process(delta):
	s1.pos += s1.V * delta;
	s2.pos += s2.V * delta;
	var dist = s2.pos - s1.pos;
	
	if norma(dist) <= sum_of_r:
		var n = dist / norma(dist);
		var v1_perp = s1.V * n;
		var v1_parallel = s1.V - v1_perp;
		var v2_perp = s2.V * n;
		var v2_parallel = s2.V - v2_perp;
		var delta_v_prep = norma(v1_perp - v2_perp);
		var j = mass_reducted * (e + 1) * delta_v_prep;
		s1.V = s1.V - j / s1.mass * n;
		s2.V = s2.V + j / s2.mass * n; 
	else:
		s1.transform.origin = s1.pos;
		s2.transform.origin = s2.pos;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
