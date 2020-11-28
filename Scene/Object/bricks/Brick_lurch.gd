extends "res://Scene/Object/bricks/Brick_monster.gd"

onready var period_label = $period
export var period_time = 2
var current_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	Events.connect("shoot_ball",self,"on_shoot_ball")
	pass # Replace with function body.

func update_UI():
	.update_UI()
	if period_label:
		period_label.text = String(period_time-current_time)

func on_shoot_ball():
	current_time+=1
	if current_time == period_time:
		current_time = 0
		do_damage()
	update_UI()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
