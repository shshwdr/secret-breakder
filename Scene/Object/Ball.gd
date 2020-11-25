extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	set_physics_process(true)

#func _physics_process(delta):
#	pass
#	var bodies = get_colliding_bodies()
#	for body in bodies:
#		if body.is_in_group("brick"):
#			body.queue_free()

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("brick"):
			body.collide_with_ball(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
