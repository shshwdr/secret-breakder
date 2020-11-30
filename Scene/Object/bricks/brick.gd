extends KinematicBody2D

onready var sprite = $sprite
onready var ghost = $ghost
onready var label_node = $Node2D
onready var label = $Node2D/Label
export var description = "A brick, hit it once to destroy it."

func _ready():
	label_node.visible = false
	var length1 = "res://Scene/Object/bricks/".length()
	var script_path = get_script().get_path()
	var length2 = script_path.length() - length1 - 3
	var script_name = script_path.substr(length1, length2)
	#print("name ",script_name)
	label.text = ResourceManager.descriptions[script_name].content
	ghost.texture = sprite.texture
	#label
	#label.text = description

# Called when the node enters the scene tree for the first time.
func collide_with_ball(ball):
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Control_mouse_entered():
	label_node.visible = true





func _on_Control_mouse_exited():
	label_node.visible = false
