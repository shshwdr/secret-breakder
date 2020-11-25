extends Node2D

onready var bullets = $bullets
onready var bricks = $bricks

# Called when the node enters the scene tree for the first time.
func _ready():
	Utils.levelgame = self
	for brick in bricks.get_children():
		if brick.get("is_monster"):
			brick.update_UI()
	

func has_monster_except(excepts):
	for brick in bricks.get_children():
		if brick.get("is_monster") and not brick.is_dead:
			if not excepts.has(brick.monster_type):
				return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
