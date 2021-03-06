extends "res://Scene/Object/bricks/brick.gd"

export var max_health = 3
export var monster_type = "monster"
var health = 3
export var attack = 1
var is_dead = false
var is_monster = true
var has_resurrected = false


onready var attack_label = $attack
onready var health_label = $health

func get_health():
	return health
	
func get_attack():
	if not Utils.levelgame:
		return 0
	var res = attack
	#seduce add
	if Utils.levelgame.has_monster_by_type("seduce"):
		res+=1
	return res

func update_UI():
	attack_label.text = String(get_attack())
	health_label.text = String(get_health())

func on_brick_die(brick):
	update_UI()

# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	health = max_health
	update_UI()
	Events.connect("brick_die",self,"on_brick_die")


func do_damage():
	$damage_sound.play()
	Utils.attack_player(get_attack())
	$AnimationPlayer.play("attack")

func check_death():
	
	if health<=0:
		
		is_dead = true
		if Utils.levelgame.has_monster_by_type("dejavu") and not has_resurrected:
			health = max_health
			is_dead = false
			has_resurrected = true
			return
		Events.emit_signal("brick_die",self)
		queue_free()
		return
	return

func collide_with_ball(ball):
	Events.emit_signal("get_hit_by_ball",self)
	health -= Utils.get_player_attack()
	check_death()
	
	#var ratio = (max_health - health) / float(max_health - 1)
	#sprite.material.set_shader_param("changeColorRatio",ratio)
	
	do_damage()
	update_UI()

