extends Node

onready var player = $AudioStreamPlayer

var music_dict = {
	"start": preload("res://sound/bg/bensound-tomorrow.ogg"),
}


# Called when the node enters the scene tree for the first time.
func _ready():
	
	play_music("start")

func play_music(music_name):
	if player.stream != music_dict[music_name]:
		player.stream = music_dict[music_name]
		player.playing = true
	

