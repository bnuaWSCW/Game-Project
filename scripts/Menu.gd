extends Control

#when the player presses play, change files and stop the music
func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/game1.tscn")
	MusicForMenu.stop()



#when the player presses options, change scenes to options menu
func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/options_menu.tscn")

#when the player presses quit, close the window
func _on_quit_pressed():
	get_tree().quit()
	
	

