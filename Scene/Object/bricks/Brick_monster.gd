extends "res://Scene/Object/brick.gd"

export var max_health = 3
export var monster_type = "monster"
var health = 3
var attack = 1
var is_dead = false
var is_monster = true


onready var attack_label = $attack
onready var health_label = $health

func get_health():
	return health
	
func get_attack():
	return attack

func update_UI():
	attack_label.text = String(get_attack())
	health_label.text = String(get_health())

# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health
	update_UI()
	Events.connect("brick_die",self,"update_UI")

func collide_with_ball(ball):
	health -= Utils.get_player_attack()
	if health<=0:
		is_dead = true
		Events.emit_signal("brick_die")
		queue_free()
		return
	
	var ratio = (max_health - health) / float(max_health - 1)
	sprite.material.set_shader_param("changeColorRatio",ratio)
	
	Utils.attack_player(get_attack())
	update_UI()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
