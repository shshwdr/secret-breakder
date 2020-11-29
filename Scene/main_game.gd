extends Node2D

var character_column = preload("res://Scene/UI/character_column.tscn")
var stage_info

var selected_level = 0
onready var character_selection = $Control/character_selection
onready var character_selection_inner = $Control/character_selection/character_selection

onready var hbox = $Control/HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	Utils.maingame = self
	var file_path = '%s/%s.json' % ["resources", "stage"]
	stage_info = Utils.load_json(file_path)
	
	for character in stage_info:
		var character_column_instance = character_column.instance()
		character_column_instance.init(character)
		hbox.add_child(character_column_instance)
	if LevelManager.unlocked_level == 21:
		$sorry_label.visible = true
	else:
		$sorry_label.visible = false
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_join_coil_pressed():
	
	OS.shell_open("https://coil.com/")


#func _on_cancel_pressed():
#	queue_free()
#
#
#func _on_confirm_pressed():
#	get_tree().change_scene("res://Scene/levels/level"+String(Utils.maingame.selected_level)+".tscn")
