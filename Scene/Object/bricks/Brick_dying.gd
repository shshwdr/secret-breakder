extends "res://Scene/Object/bricks/Brick_monster.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("get_hit_by_ball",self,"on_get_hit_by_ball")

func on_get_hit_by_ball(brick):
	health -= Utils.get_player_attack()
	check_death()
	update_UI()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
