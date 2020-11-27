extends KinematicBody2D

onready var sprite = $sprite
onready var label_node = $Node2D
onready var label = $Node2D/Label
export var description = "A brick, hit it once to destroy it."

func _ready():
	label_node.visible = false
	print("name ",name)
	label.text = ResourceManager.descriptions[name].content
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
