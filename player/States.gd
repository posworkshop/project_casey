extends Node

signal finished(next_state_name)

func enter():
	return

func exit():
	return
	
func update(delta):
	return
	
func handle_input():
	return
	
func on_animation_finished(anim_name):
	return
	
func _update_look_direction(facing):
	return
	
func _get_movement_direction():
	var direction = Vector2()
	
	direction.x = int(Input.is_action_pressed("movement_right")) - int(Input.is_action_pressed("movement_left"))
	direction.y = int(Input.is_action_pressed("movement_down")) - int(Input.is_action_pressed("movement_up"))
	
	return direction.normalized()

func _get_vector_owner_to_mouse():
	return owner.get_global_mouse_position() - owner.get_global_position()