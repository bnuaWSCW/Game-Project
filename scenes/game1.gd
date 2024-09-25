extends Node2D

# -- VARIABLES --#
@onready var pause_menu = $"CharacterBody2D/Camera2D2/Pause Menu"
var paused = false

#-- FUNCTIONS --#

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		# if the player presses the escape button/pause button, do the pauseMenu function
		pauseMenu()

func pauseMenu():
	# if paused is true
	if paused:
		#hide the pause menu and resume the game
		pause_menu.hide()
		get_tree().paused = false
	# if paused is false
	else:
		# show the pause menu and pause the game
		pause_menu.show()
		get_tree().paused = true
		
	# whatever pause is right now, make it the opposite(if pause = true, !pause = false)
	paused = !paused
