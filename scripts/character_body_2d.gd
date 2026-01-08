extends CharacterBody2D


const SPEED = 4000.0
const JUMP_VELOCITY = -300.0

var flipped: bool = false # for flipping the horizontal when moving left or right

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x > 0 and not flipped:
		flip_horizontal()
		flipped = true
	elif velocity.x < 0 and flipped:
		flip_horizontal()
		flipped = false
	
	move_and_slide()

func flip_horizontal():
	scale.x *= -1

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("quit"):
		get_tree().quit()
