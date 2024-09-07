extends RigidBody2D

@export var should_bounce: bool = false 

var direction = Vector2.ZERO
var force_applied = false

func _ready():
	if physics_material_override:
		physics_material_override.bounce = 0.5
		linear_damp = 0.5
		angular_damp = 0.3

func _integrate_forces(state):
	if state.get_contact_count() > 0:
		if not should_bounce:
			linear_velocity = Vector2.ZERO
			angular_velocity = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		direction = (event.position - global_position).normalized()
		apply_impulse(direction * 300)