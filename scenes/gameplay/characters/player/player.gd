extends CharacterBody2D
class_name Player


@onready var velocity_2d := $Velocity2D as Velocity2D


func _physics_process(delta: float) -> void:
	var direction := _get_movement_vector().normalized()
	velocity_2d.accelerate_in_direction(direction)
	velocity_2d.move(self)


func _get_movement_vector() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")
