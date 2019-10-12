extends CheckButton

func _ready():
	pressed = false
	emit_signal("toggled", pressed)