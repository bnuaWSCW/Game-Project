extends CharacterBody2D

# Character Speed 
const SPEED = 50.0

# Vector - based on my information, holds two float values(x, y)
var input: Vector2

# Reading the Players Input and Turning it into Directions
func get_input():
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input.normalized()
	
func _process(_delta):
	var playerInput = get_input()
	
	velocity = playerInput * SPEED
	
	# Moving to the nearing whole pixel after moving
	position.x = round(position.x)
	position.y = round(position.y)


# Handles Collisions anad Sliding Accorss Surfaces
	move_and_slide()
