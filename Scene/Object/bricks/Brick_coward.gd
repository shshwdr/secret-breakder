extends "res://Scene/Object/bricks/Brick_monster.gd"

#when one monster get killed, attack--

var attack_debuff = 0

func get_attack():
	return max(1,attack - attack_debuff)

func on_brick_die(brick):
	attack_debuff+=1
	.on_brick_die(brick)
	

