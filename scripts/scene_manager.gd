class_name SceneManager extends Node

var SoldierMainCharacter: CharacterBody2D

var scene_dir_path = "res://scenes/"

func change_scene(from, to_scene_name: String) -> void:
	SoldierMainCharacter = from.soldierMainCharacter
	SoldierMainCharacter.get_parent().remove_child(SoldierMainCharacter)
	
	var full_path = scene_dir_path + to_scene_name + ".tscn"
	from.get_tree().call_deferred("change_scene_to_file", full_path)
