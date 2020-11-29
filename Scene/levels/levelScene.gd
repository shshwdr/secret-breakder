extends Node2D

onready var bullets = $bullets
onready var bricks = $bricks
onready var level_ending_node = $level_ending
onready var level_ending_label = $level_ending/ColorRect/RichTextLabel
onready var target = $bricks/Brick_target

export var current_level:int

func level_end():
	#stop bullets
	for bullet in bullets.get_children():
		bullet.queue_free()
	level_ending_node.visible = true
	Utils.is_game_paused = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$character.texture = load(Utils.selected_character.sprite)
	LevelManager.current_level = current_level
	Utils.levelgame = self
	for brick in bricks.get_children():
		if brick.get("is_monster"):
			brick.update_UI()
	level_ending_label.bbcode_text = LevelManager.get_level_info().content
	target.sprite.texture = load(LevelManager.get_level_info().target_sprite)

func has_monster_except(excepts):
	for brick in bricks.get_children():
		if brick.get("is_monster") and not brick.is_dead:
			if not excepts.has(brick.monster_type):
				return true
	return false
	
func has_monster_by_type(type):
	for brick in bricks.get_children():
		if brick.get("is_monster") and not brick.is_dead:
			if brick.monster_type == type:
				return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if DebugSetting.can_jump_level and event is InputEventKey and event.pressed:
		if event.scancode == KEY_0:
			_on_Button_pressed()

func _on_Button_pressed():
	Utils.is_game_paused = false
	var change_scene = LevelManager.level_up()
	get_tree().change_scene(change_scene)
	pass # Replace with function body.
