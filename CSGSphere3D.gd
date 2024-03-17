extends CSGSphere3D

#Rozważamy tylko i wyłącznie składową pionową bo to w niej zachodzi ruch
var V = 0.0	#Aktualna prędkość kulki
var g = 1.0	#Przyspieszenie ziemskie ustawiamy tak, by niedziałało zbyt szybko
var r = 1.0	#Promień na potrzeby symulacji fozyki
var obj		#Objętość kulki
var ro_wody = 1000.0	#Gęstość wody
var ro_kulki = 500.0	#Gęstość Kulki
var masa_kulki
var a_wyp	#Wyporność prędkość związana z siłą wyporu
var lepkosc = 0.001	#Lepkość cieczy do prawa sokratesa

func _ready():
	obj = 4 / 3 * PI * r * r * r
	masa_kulki = obj * ro_kulki

func _physics_process(delta):
	V = V - g * delta
	
	if transform.origin.y < 0:
		a_wyp = g * ro_wody / ro_kulki
		V = V + a_wyp * delta
		V = V - 6 * PI * lepkosc * r * V
	
	self.transform.origin.y += V * delta
