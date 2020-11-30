extends RigidBody2D

# Called when the node enters the scene tree for the first time.



func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("brick"):
			body.collide_with_ball(self)
			$AudioStreamPlayer2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
