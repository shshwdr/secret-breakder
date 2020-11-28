extends Node2D

var character_column = preload("res://Scene/UI/character_column.tscn")
var stage_info

onready var hbox = $Control/HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	var file_path = '%s/%s.json' % ["resources", "stage"]
	stage_info = Utils.load_json(file_path)
	
	for character in stage_info:
		var character_column_instance = character_column.instance()
		character_column_instance.init(character)
		hbox.add_child(character_column_instance)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
