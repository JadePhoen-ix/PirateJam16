extends CharacterBody2D
class_name Player


@onready var velocity_2d := $Velocity2D as Velocity2D

var current_dash: Dash


func _physics_process(delta: float) -> void:
	if current_dash != null:
		return
	
	var direction := _get_movement_vector().normalized()
	velocity_2d.accelerate_in_direction(direction)
	
	velocity_2d.move(self)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("mobility"):
		var data := {
			direction = get_global_mouse_position() - global_position,
			duration = 0.25,
			speed = velocity_2d.max_speed * 5.0,
			velocity_2d = velocity_2d,
			body = self
		}
		current_dash = Dash.create(data)


func _get_movement_vector() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")
