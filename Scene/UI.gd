extends Control


onready var health_label = $health

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("update_health",self,"on_update_health")

func on_update_health():
	health_label.text = String(Utils.player_health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
