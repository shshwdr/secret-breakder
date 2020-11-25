extends "res://Scene/Object/bricks/Brick_monster.gd"

#when there are other monsters in scene, attack upup

func get_attack():
	if not Utils.levelgame:
		return 0
	if Utils.levelgame.has_monster_except([monster_type]):
		return attack*2
	return attack

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
