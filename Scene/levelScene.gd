extends Node2D

onready var bullets = $bullets

# Called when the node enters the scene tree for the first time.
func _ready():
	Utils.levelgame = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
