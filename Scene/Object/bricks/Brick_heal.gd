extends "res://Scene/Object/bricks/brick.gd"

export var heal_value:int

func get_heal_value():
	return heal_value

func collide_with_ball(ball):
	Utils.attack_player(-get_heal_value())
	Events.emit_signal("heal")
	queue_free()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
