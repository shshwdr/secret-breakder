extends Node2D

onready var shooting_point = $shootingPoint

export var ball_speed = 300

func reparent(node,new_parent):
  node.get_parent().remove_child(node) # error here  
  new_parent.add_child(node) 

var ball_scene = preload("res://Scene/Object/Ball.tscn")
var ball_instance
func _process(delta):
	if Utils.is_game_paused:
		return
	var mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	#if shooting_point.get_child_count()==0:
	if Input.is_action_just_pressed("left_mouse"):
		#reparent(ball_instance,Utils.levelgame.bullets)
		Events.emit_signal("shoot_ball")
		ball_instance = ball_scene.instance()
		Utils.levelgame.bullets.add_child(ball_instance)
		ball_instance.position = shooting_point.global_position
#		var test:RigidBody2D = ball_instance.rigidbody
#		test.linear_velocity
		var direction = (mouse_position - position).normalized()
		ball_instance.linear_velocity = direction*ball_speed
		


