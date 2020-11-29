extends Button

onready var texture = $TextureRect

var character_info

func init(character):
	character_info = character
	

# Called when the node enters the scene tree for the first time.
func _ready():
	texture.texture = load(character_info.sprite)
	if not WebMonetization.is_paying():
		focus_mode = Control.FOCUS_NONE
		disabled = true
		texture.modulate = Color("504d4d")


func _on_character_selection_button_pressed():
	Utils.selected_character = character_info
	Events.emit_signal("update_select_character")
