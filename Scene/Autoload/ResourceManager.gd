extends Node


var descriptions
var resource_folder = "res://resources"
var description_file = "description"

func _ready():
	load_descripts_info()
	
func load_descripts_info():
	var file_path = '%s/%s.json' % [resource_folder, description_file]
	descriptions = Utils.load_json(file_path)
