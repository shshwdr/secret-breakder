extends Node2D

onready var bullets = $bullets
onready var bricks = $bricks
onready var level_ending_node = $level_ending

func level_end():
	#stop bullets
	for bullet in bullets.get_children():
		bullet.queue_free()
	level_ending_node.visible = true
	Utils.is_game_paused = true

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


func _on_Button_pressed():
	Utils.is_game_paused = false
	LevelManager.level_up()
	get_tree().change_scene("res://Scene/levels/level"+String(LevelManager.current_level)+".tscn")
	pass # Replace with function body.
