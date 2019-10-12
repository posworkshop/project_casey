extends KinematicBody2D


var max_stamina = 3
var current_stamina = max_stamina


onready var states_map = {
	"idle": $States/Idle,
	"walking": $States/Walking,
	"attacking": $States/Attacking
}

var current_state

func _ready():
	for state_node in $States.get_children():
		state_node.connect("finished", self, "_change_state")
	var initial_state = "idle"
	current_state = states_map[initial_state]
	_change_state(initial_state)


func _process(delta):
	current_state.update(delta)



func _change_state(state):
	current_state.exit()
	current_state = states_map[state]
	current_state.enter()
	
	$DebugNode/DebugText.set_text(current_state.name)


func _on_AnimationPlayer_animation_finished(anim_name):
	current_state.on_animation_finished(anim_name)


func _on_AttackReach_body_entered(body):
	body.get_node("AnimationPlayer").play("Hit")


func _on_CheckButton_toggled(button_pressed):
	$DebugNode.visible = button_pressed
