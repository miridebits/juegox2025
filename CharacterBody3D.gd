extends CharacterBody3D

# How fast the player moves in meters per second.
@export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75
# Combina velocidad con una dirección
var target_velocity = Vector3.ZERO

# Para calcular los movimientos
func _physics_process(delta):
	# We create a local variable to store the input direction.
	var direction = Vector3.ZERO

	# Movimientos de acuerdo a las teclas que definimos
	if Input.is_action_pressed("move_right"):
		direction.x += 0.5
	if Input.is_action_pressed("move_left"):
		direction.x -= 0.5
	if Input.is_action_pressed("move_back"):
		# Notice how we are working with the vector's x and z axes.
		# In 3D, the XZ plane is the ground plane.
		direction.z += 0.5
	if Input.is_action_pressed("move_forward"):
		direction.z -= 0.5
	
	
	#Por si aprieta dos teclas al mismo tiempo CORREGIR
	
	#if direction != Vector3.ZERO:
			#direction = direction.normalized()
			# Setting the basis property will affect the rotation of the node.
			#$Pivot.basis = Basis.looking_at(direction)

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Moving the Character
	velocity = target_velocity
	move_and_slide()
