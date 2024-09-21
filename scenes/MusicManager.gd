extends AudioStreamPlayer

var is_playing_music = false

func _ready():
	if not is_playing():
		play()
		is_playing_music = true
