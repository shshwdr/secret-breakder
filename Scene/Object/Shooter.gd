extends Node2D

onready var shooting_point = $shootingPoint

func reparent(node,new_parent):
  node.get_parent().remove_child(node) # error here  
  new_parent.add_child(node) 

var ball_scene = preload("res://Scene/Object/Ball.tscn")
var ball_instance
func _process(delta):
	look_at(get_global_mouse_position())
	if shooting_point.get_child_count()==0:
		ball_instance = ball_scene.instance()
		ball_instance.position = shooting_point.position
		shooting_point.add_child(ball_instance)
	if Input.is_action_just_pressed("left_mouse"):
		reparent(ball_instance,self)
		ball_instance.position = shooting_point.position
#		var test:RigidBody2D = ball_instance.rigidbody
#		test.linear_velocity
		ball_instance.rigidbody.linear_velocity = Vector2(100,-100)
		


