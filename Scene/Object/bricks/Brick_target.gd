extends "res://Scene/Object/bricks/brick.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func collide_with_ball(ball):
	Utils.levelgame.level_end()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
