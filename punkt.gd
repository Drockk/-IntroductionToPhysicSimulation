extends Node2D

var Vy = -1
var Vx = 0
var skala = 1.0
var G = 0.7

func _physics_process(delta):
	self.transform.origin.y += Vy;
	self.transform.origin.x += Vx;
	
	self.scale.x = skala;
	self.scale.y = skala;
	skala = skala - 0.01
	if skala < 0.01:
		skala = 0.01
		
	G = G - 0.01
	self.modulate = Color(1.0, G, 0.0)

func _ready():
	var timer = Timer.new()
	self.add_child(timer)
	timer.connect("timeout", self.queue_free)
	timer.set_wait_time(2)
	timer.start()
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	Vx = rng.randf_range(-0.25, 0.25)
	
	self.modulate = Color(1.0, G, 0.0)
