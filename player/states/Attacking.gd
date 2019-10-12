extends "res://player/States.gd"

var processed = false
var attack_sequence_number = 0
var attack_animations = []

func _ready():
	attack_animations = []
	for animation in owner.get_node("AnimationPlayer").get_animation_list():
		if animation.find("Attacking") >= 0:
			attack_animations.append(animation)

	print_debug(attack_animations)

func enter():
	processed = false
	attack_sequence_number = 0
	_update_look_direction(_get_vector_owner_to_mouse())
	owner.get_node("AnimationPlayer").play(attack_animations[attack_sequence_number])


func update(delta):
	if not processed:
		_update_look_direction(_get_vector_owner_to_mouse())
		processed = true

	if Input.is_action_pressed("action_attack") and owner.get_node("AttackReach").can_advance:
		attack_sequence_number += 1
		attack_sequence_number %= attack_animations.size()
		_update_look_direction(_get_vector_owner_to_mouse())
		owner.get_node("AnimationPlayer").play(attack_animations[attack_sequence_number])

func exit():
	processed = false

func _update_look_direction(facing):
	if facing.x >= 0:
		owner.get_node("AnimatedSprite").set_flip_h(false)
		owner.get_node("AttackReach").set_position(owner.get_node("WeaponPivot").get_position())
	else:
		owner.get_node("AnimatedSprite").set_flip_h(true)
		owner.get_node("AttackReach").set_position(owner.get_node("WeaponPivot").get_position().reflect(Vector2(0, 1)))
	
	
func on_animation_finished(anim_name):
	if anim_name in attack_animations:
		emit_signal("finished", "idle")
	