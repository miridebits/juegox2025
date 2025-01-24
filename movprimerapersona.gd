extends CharacterBody3D

@onready var jugador = $"."
@onready var atril = $personaje
@onready var camara = $personaje/Camera3D
const SPEED = 3.0
@export var sens = -0.5


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _input(event):
	if global.is_in_dialogue == false:
		if event is InputEventMouseMotion:
			rotate_y(deg_to_rad(event.relative.x * sens))
			atril.rotate_y(deg_to_rad(event.relative.x * sens))
			camara.rotate_x(deg_to_rad(event.relative.y * sens))
			#camara.rotation.x = clamp(atril.rotation.y, deg_to_rad(0), deg_to_rad(360))

func _physics_process(delta):
	if global.is_in_dialogue == false:
		var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			#rota el atril
			#camara.look_at (position - direction)
			
			#avanzar
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
				
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
