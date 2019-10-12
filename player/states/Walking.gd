extends "res://player/States.gd"


var speed = 350
var velocity = Vector2()

func enter():
	#owner.set_physics_process(true)
	_update_look_direction(Vector2(1, 0))
	owner.get_node("AnimationPlayer").play("Walking")


func update(delta):
	
	if Input.is_action_pressed("action_attack"):
		emit_signal("finished", "attacking")

	var moving_direction = _get_movement_direction()
	if not moving_direction:
		emit_signal("finished", "idle")
	
	_update_look_direction(moving_direction)
	_move(moving_direction, speed)

#func exit():
#	owner.set_physics_process(false)

func _move(direction, speed):
	velocity = direction * speed
	owner.move_and_slide(velocity)


func _update_look_direction(facing):
	if facing.x >= 0:
		owner.get_node("AnimatedSprite").set_flip_h(false)
	else:
		owner.get_node("AnimatedSprite").set_flip_h(true)
