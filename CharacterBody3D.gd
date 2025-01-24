extends CharacterBody3D

# How fast the player moves in meters per second.
@export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75
# Sensibilidad de rotación para el mouse
@export var mouse_sensitivity = 0.003

# Combina velocidad con una dirección
var target_velocity = Vector3.ZERO

# Para rotación del personaje basado en el mouse
var yaw = 0.0

# Para calcular los movimientos
func _physics_process(delta):
	# Movimientos del personaje según teclas
	var direction = Vector3.ZERO

	# Movimientos de acuerdo a las teclas que definimos
	if Input.is_action_pressed("move_right"):
		direction.x += 0.5
	if Input.is_action_pressed("move_left"):
		direction.x -= 0.5
	if Input.is_action_pressed("move_back"):
		direction.z += 0.5
	if Input.is_action_pressed("move_forward"):
		direction.z -= 0.5

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Vertical Velocity
	if not is_on_floor(): # Si está en el aire, aplicar gravedad
		target_velocity.y -= fall_acceleration * delta

	# Mover el personaje
	velocity = target_velocity
	move_and_slide()

	# Actualizar la rotación del personaje basado en el mouse
	_update_rotation_from_mouse(delta)


# Rotación del personaje según el movimiento del mouse
func _input(event):
	if event is InputEventMouseMotion:
		# Yaw (rotación horizontal) con el movimiento en el eje X del mouse
		yaw -= event.relative.x * mouse_sensitivity

# Esta función se encarga de aplicar la rotación calculada
func _update_rotation_from_mouse(delta):
	# Crear una rotación para el personaje usando yaw (rotación Y)
	var rotation = Basis()
	rotation = rotation.rotated(Vector3.UP, yaw)
	
	# Aplicar la rotación al nodo
	$MeshInstance3D.basis = rotation
