extends Node3D

var box;
var sphere;
#var line = Line2D.new();

# Called when the node enters the scene tree for the first time.
func _ready():
	sphere = get_node("CollisionShape3D");
	box = get_node("box");
	
	#line.add_point(box.position.xy);
	#line.add_point(sphere.position);
	#line.width = 1;
	#self.add_child(line);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
