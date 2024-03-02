extends Node3D

var sphere;

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0 ,4):
		var n = CSGSphere3D.new();
		n.name = "sfera" + str(i);
		n.radius = 1;
		n.radial_segments = 20;
		n.rings = 20;
		n.transform.origin.x = 5 * i;
		self.add_child(n);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#sphere.transform.origin += sphere.V * delta;
