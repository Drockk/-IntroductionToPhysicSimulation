extends CSGSphere3D

var r = 5;
var V = Vector3(10, 0, 0);
var pos = Vector3(-50, 0, 0);
var mass = 10;

# Called when the node enters the scene tree for the first time.
func _ready():
	self.radius = r;
	self.transform.origin = pos;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
