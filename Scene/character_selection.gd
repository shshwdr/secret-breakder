extends ColorRect

var character_selection_button = preload("res://Scene/UI/character_selection_button.tscn")
onready var web_mono_label = $Web_mone_label

onready var ability_desc = $ability_description

# Called when the node enters the scene tree for the first time.
func _ready():
	if WebMonetization.is_paying():
		web_mono_label.bbcode_text = "Thanks for support us with web monetization! You can select a character now!"
		web_mono_label.rect_size = Vector2(352,32)
		$join_coil.visible = false
	else:
		web_mono_label.bbcode_text = "You've unlocked some characters, join [color=yellow]coil[/color] to use them and support the game!"
		web_mono_label.rect_size = Vector2(288,32)
		$join_coil.visible = true
		
	
	var file_path = '%s/%s.json' % ["res://resources", "character"]
	var characters_info = Utils.load_json(file_path)
		
	for character in characters_info:
		if character.required_level<=LevelManager.unlocked_level:
			var character_selection_button_instance = character_selection_button.instance()
			character_selection_button_instance.init(character)
			if Utils.selected_character and Utils.selected_character == character or character.name == "None":
				ability_desc.text = character.description
				character_selection_button_instance.grab_focus()
			$HBoxContainer.add_child(character_selection_button_instance)
	Events.connect("update_select_character",self, "update_select_character")

func update_select_character():
	for child in $HBoxContainer.get_children():
		var character = child.character_info
		if Utils.selected_character and Utils.selected_character == character or character.name == "None":
			ability_desc.text = character.description
			child.grab_focus()


func _on_confirm_pressed():
	Utils.update_player_health()
	get_tree().change_scene("res://Scene/levels/level"+String(Utils.maingame.selected_level)+".tscn")


func _on_cancel_pressed():
	get_parent().visible = false
