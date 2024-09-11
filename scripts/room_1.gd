extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	if scene_manager.SoldierMainCharacter:
		add_child(scene_manager.SoldierMainCharacter)

