extends Node2D

var sphere;

var S = Vector2(300, 100);
var eq_length = 100;
var k = 2;
var pendulum_force = Vector2(0, 0);
var V = Vector2(0, 0);
var g = Vector2(0, 100);
var line = Line2D.new();

func get_distance():
	return sqrt(pow((S.x - sphere.position.x), 2) + pow((S.y - sphere.position.y), 2));

func calc_pendulum_force():
	var d = get_distance();
	var F = k * (eq_length - d);
	var Fx = (sphere.position.x - S.x) / d * F;
	var Fy = (sphere.position.y - S.y) / d * F;
	pendulum_force.x = Fx;
	pendulum_force.y = Fy;

# Called when the node enters the scene tree for the first time.
func _ready():
	sphere = get_node("StaticBody2D");
	sphere.position.x = 400;
	sphere.position.y = 200;
	
	line.add_point(S);
	line.add_point(sphere.position);
	line.width = 1;
	self.add_child(line);

func _draw():
	draw_circle(S, 5, Color.RED);

func _physics_process(delta):
	calc_pendulum_force();
	V += delta * (pendulum_force + g);
	sphere.position += delta * V;
	line.points[1] = sphere.position;
