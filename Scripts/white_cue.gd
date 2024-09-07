extends RigidBody2D

var direction = Vector2.ZERO
var force_applied = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		direction = (event.position - global_position).normalized()
		apply_impulse(direction * 300)