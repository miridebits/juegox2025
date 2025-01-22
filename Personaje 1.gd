extends CharacterBody3D

var player_in_range = false

# Función que se ejecuta cuando el nodo está listo en la escena
func _ready():
	# Asegúrate de que el nodo Area3D esté presente y conecte las señales correctamente
	var area = $Area3D  # Obtienes la referencia al nodo Area3D
	area.connect("body_entered", Callable(self, "_on_body_entered"))  # Conectas la señal a la función
	area.connect("body_exited", Callable(self, "_on_body_exited"))  # Conectas la señal a la función

# Esta función se llama cuando otro cuerpo entra en el área de proximidad
func _on_body_entered(body):
	# Verificamos que el cuerpo que entra es el jugador (o el NPC con el que queremos interactuar)
	if body is CharacterBody3D:  # Cambia esto si es un nodo específico
		if body.name == "Personaje principal":
			player_in_range = true
			OS.alert("El jugador ha entrado en el rango de interacción")
			print("El jugador ha entrado en el rango de interacción")
			show_interaction_options()

# Esta función se llama cuando otro cuerpo sale del área de proximidad
func _on_body_exited(body):
	# Verificamos que el cuerpo que sale es el jugador (o el NPC con el que queremos interactuar)
	if body is CharacterBody3D:  # Cambia esto si es un nodo específico
		if body.name == "Personaje principal":
			player_in_range = false
			OS.alert("El jugador ha salido del rango de interacción")
			print("El jugador ha salido del rango de interacción")
			hide_interaction_options()

# Mostrar opciones de interacción (puede ser un menú UI o texto en pantalla)
func show_interaction_options():
	# Aquí puedes activar el menú de opciones, o mostrar algo en la pantalla
	print("Mostrar opciones de interacción")

# Ocultar opciones de interacción
func hide_interaction_options():
	# Aquí ocultas el menú o indicador visual
	print("Ocultar opciones de interacción")
	
# Función que se ejecuta en cada frame
func _process(delta):
	# Verificar si el jugador está en rango y presiona la tecla de interacción
	if player_in_range and Input.is_action_just_pressed("interact"):
		interact()

# Función para manejar la interacción
func interact():
	# Aquí va lo que sucederá cuando el jugador presione la tecla de interacción (E)
	print("Interacción realizada con el personaje.")
	# Puedes agregar aquí la lógica de la acción, como abrir un menú, mostrar un mensaje, etc.
	# Ejemplo:
	show_dialog()

# Función para mostrar un diálogo
func show_dialog():
	print("¡Has iniciado un diálogo con el personaje!")
