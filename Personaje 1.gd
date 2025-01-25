extends CharacterBody3D

#Manu

var player_in_range = false
var repeticion = true

# Función que se ejecuta cuando el nodo está listo en la escena
func _ready():
	#Creo la variable de la ruta
	var area = $Area3D 
	area.connect("body_entered", Callable(self, "_on_body_entered"))  # Conectas la señal a la función
	area.connect("body_exited", Callable(self, "_on_body_exited"))  # Conectas la señal a la función

func _on_dialogue_finished():
	global.is_in_dialogue = false
# Esta función se llama cuando otro cuerpo entra en el área de proximidad
func _on_body_entered(body):
	# Verificamos que el cuerpo que entra es el jugador.
	if body is CharacterBody3D:  # Cambia esto si es un nodo específico (como la puerta)
		if body.name == "Personajeprincipal":
			player_in_range = true
			print("El jugador ha entrado en el rango de interacción")
			if repeticion:
				Dialogic.start("Timelines Dialogos Juego/MANU INTRO")
				global.introducciones += 1
				repeticion = false
			if global.introducciones == 4:
				Dialogic.start("contiue")
			pass



# Esta función se llama cuando otro cuerpo sale del área de proximidad
func _on_body_exited(body):
	# Verificamos que el cuerpo que sale es el jugador.
	if body is CharacterBody3D:  # Cambia esto si es un nodo específico
		if body.name == "Personajeprincipal":
			player_in_range = false
			print("El jugador ha salido del rango de interacción")

func _process(_delta):
	# Verificar si el jugador está en rango y presiona la tecla de interacción
	if player_in_range and Input.is_action_just_pressed("interact") and global.introducciones == 4:
		interact()

# Función para manejar la interacción
func interact():
	# Aquí va lo que sucederá cuando el jugador presione la tecla de interacción (E)
	Dialogic.start("Timelines Dialogos Juego/MANU DECISIÓN")
