extends CharacterBody2D


# ------------------------------------ #
#      VARIABLES AND CONSTANTS         #
# ------------------------------------ #

# ------------------------------------------------------------------------------------------------------------#

@export var SPEED = 50 								# The Speed of the Character
@onready var animated_sprite = $AnimatedSprite2D	# Enemy animated sprite
var player_chase = false							# This checks if the enemy should be chasing the character
var player = null									# Refers to the character when they enter the detection area.
var health = 40										# Enemy health
var player_in_zone = false							# Refers to if the player is in the enemy's attack range
var take_damage = true								# If and when the enemy can take damage


# ------------------------------------------------------------------------------------------------------------#

# ----------------------------------- #
#              FUNCTIONS              #
# ----------------------------------- #

#-- MAIN PROCESS FUNCTION --#
func _physics_process(delta):
	
	
	# Damage from player attacks
	damage()

	# If player_chase is true, enemy should chase the character.
	if player_chase:
		
		# Moving to player based on speed
		position += (player.position - position)/SPEED
		
		# When moving to player, check if player is in attack zone. 
		if player_in_zone == true:
			# If player is in attack zone, play attack animation
			animated_sprite.play("Attack")
		else:
			# If player is not in attack zone, play walking animation.
			animated_sprite.play("Walk")
		
		# Refer to testing in Development Log
		move_and_collide(Vector2(0,0))
		
		# Flipping design based off of the direction in which the enemy is going
		if(player.position.x - position.x) < 0:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false
	else:
		# If no movement or direction, play idle animation
		animated_sprite.play("Idle")
		
#-- PLAYER ENTERING ENEMY DETECTION AREA FUNCTION --#
func _on_dectection_area_body_entered(body):
	player = body
	# Indicates to chase the player
	player_chase = true
	
#-- PLAYER EXITING ENEMY DETECTION AREA FUNCTION --#
func _on_dectection_area_body_exited(body):
	player = null
	# Stops chasing the character.
	player_chase = false

func enemy():
	pass

#-- PLAYER ENTERING ENEMY ATTACK AREA --#
func _on_enemy_hitbox_body_entered(body):
	# If the body entered is actually the player
	if body.has_method("player"):
		player_in_zone = true

			

#-- PLAYER EXITING ENEMY ATTACK AREA --#
func _on_enemy_hitbox_body_exited(body):
	# If the body exiting is actually the player
	if body.has_method("player"):
		player_in_zone = false



#-- TAKING DAMAGE FROM PLAYER --#
func damage():
	# When the player is in the attack zone and is inputing an attack input
	if player_in_zone and global.player_current_attack == true:
		if take_damage == true:
			# Reduce health
			health = health -20
			# Cooldown starting to prevent simultaneous attacks
			$Damage_Cooldown.start()
			# Preventing attacks until cooldown finishs
			take_damage = false
			# Enemy health status
			print("orc health =", health)
			if health <= 0:
				self.queue_free() 		# WILL DELETE 

#-- COOLDOWN ENDING --#
func _on_damage_cooldown_timeout():
	take_damage = true
