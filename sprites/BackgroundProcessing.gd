extends Sprite2D

@export var player: CharacterBody2D  # Reference to the player
@export var shift_speed: float = .5 # Controls how smoothly the colors cycle

var shift_amount: float = 0.0 # Cycles the colors between -3 and 3
var tint_amount: float = 0.0 # Gradually increases from 0 to 0.3

func _process(delta: float) -> void:
	if player:
		# Create a looping effect using sin() to cycle smoothly between -3 and 3
		var mapped_x_shift = sin(player.position.x * 0.0001) * 3.0  
		
		# Slowly increase tint_amount but clamp it at 0.3
		var target_tint = clamp(player.position.x * 0.0001, 0.0, 0.1)
		
		# Smoothly interpolate the values
		shift_amount = move_toward(shift_amount, mapped_x_shift, shift_speed * delta)
		
		
		print(shift_amount, " ", tint_amount, " ", player.position.x)
		# Apply to shader
		material.set_shader_parameter("shift_amount", shift_amount)
