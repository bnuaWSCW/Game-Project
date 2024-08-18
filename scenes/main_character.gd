extends CharacterBody2D

# Speed and Acceleration
const SPEED = 50.0
const ACCEL = 2.0


var input: Vector2

func get_input():
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input.normalized()
	
func _process(_delta):
	var playerInput = get_input()
	
	velocity = playerInput * SPEED
	
	position.x = round(position.x)
	position.y = round(position.y)

	move_and_slide()
