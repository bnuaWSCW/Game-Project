extends CharacterBody2D

# The Speed of the Character
@export var SPEED = 50
@onready var animated_sprite = $AnimatedSprite2D

# This checks if the enemy should be chasing the character
var player_chase = false

# Refers to the character when they enter the detection area.
var player = null

var health = 100
var player_in_zone = false

func _physics_process(delta):
	# If player_chase is true, enemy should chase the character.
	if player_chase:
		position += (player.position - position)/SPEED
		
		animated_sprite.play("Walk")
		
		move_and_collide(Vector2(0,0))
		
		if(player.position.x - position.x) < 0:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false
	else:
		animated_sprite.play("Idle")
		
		

# Handles the character entering into the detection area.
func _on_dectection_area_body_entered(body):
	player = body
	# Indicates to chase the player
	player_chase = true
	
# Handles the character exiting the detection area.
func _on_dectection_area_body_exited(body):
	# Stops chasing the character.
	player = null
	player_chase = false

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_in_zone = true


func _on_enemy_hitbox_body_exited(body):
	pass # Replace with function body.
