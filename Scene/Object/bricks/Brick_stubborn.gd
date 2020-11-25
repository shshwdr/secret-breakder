extends "res://Scene/Object/bricks/Brick_monster.gd"

#when there are other monsters in scene, attack upup

func get_attack():
	if not Utils.levelgame:
		return 0
	if Utils.levelgame.has_monster_except([monster_type]):
		return attack*2
	return attack

