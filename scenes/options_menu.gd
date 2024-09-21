extends Control


#when player presses back, go to main menu
func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
