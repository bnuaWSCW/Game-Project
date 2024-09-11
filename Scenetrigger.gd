class_name SceneTrigger extends Area2D

@export var connect_scene: String #name of scene
var scene_folder = "res://scenes/"

func _on_body_entered(body):
	scene_manager.change_scene(get_owner(), connect_scene)
