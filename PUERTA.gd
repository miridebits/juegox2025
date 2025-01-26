extends CharacterBody3D

#Puerta
@onready var puerta = $"."

var player_in_range = false
var repeticion = true
var decisiones = true

# Función que se ejecuta cuando el nodo está listo en la escena

func _ready():
	#Creo la variable de la ruta
#	musica.play()
	var area = $Area3D
	area.connect("body_entered", Callable(self, "_on_body_entered"))  # Conectas la señal a la función
	area.connect("body_exited", Callable(self, "_on_body_exited"))  # Conectas la señal a la función

# Esta función se llama cuando otro cuerpo entra en el área de proximidad
func _on_body_entered(body):
	# Verificamos que el cuerpo que entra es el jugador.
	if body is CharacterBody3D:  # Cambia esto si es un nodo específico (como la puerta)
		if body.name == "Personajeprincipal":
		#	corina.play()
			player_in_range = true
			print("El jugador ha entrado en el rango de interacción")
			if repeticion:
				if global.decisiones == 4:
					#dialogo
					pass
