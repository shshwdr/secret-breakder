extends VBoxContainer

onready  var name_label = $Name
onready var texture = $TextureRect
var character_info
var stage_button = preload("res://Scene/UI/StageButton.tscn")

func init(character):
	character_info = character

# Called when the node enters the scene tree for the first time.
func _ready():
	var is_unlocked = false
	
	for stage in character_info.stages:
		var start_level = stage.start_level
		if start_level<=LevelManager.unlocked_level:
			is_unlocked = true
			var stage_button_instance = stage_button.instance()
			stage_button_instance.text = stage.name
			stage_button_instance.start_level = start_level
			add_child(stage_button_instance)
		
	if is_unlocked:
		name_label.text = character_info.name
		texture.texture = load(character_info.sprite)
	else:
		name_label.text = "???"
		texture.texture = load("res://art/question.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
