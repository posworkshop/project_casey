extends "res://player/States.gd"

func enter():
	_update_look_direction(_get_vector_owner_to_mouse())
	owner.get_node("AnimationPlayer").play("Idle")


func update(delta):
	
	if Input.is_action_pressed("action_attack"):
		emit_signal("finished", "attacking")
	
	if _get_movement_direction():
		emit_signal("finished", "walking")
		
	_update_look_direction(_get_vector_owner_to_mouse())
		
func _update_look_direction(facing):
	if facing.x >= 0:
		owner.get_node("AnimatedSprite").set_flip_h(false)
	else:
		owner.get_node("AnimatedSprite").set_flip_h(true)
		
	
