extends Node
class_name Velocity2D


@export_range(0.0, 100.0, 0.25) var max_speed := 40.0
@export_range(0.0, 100.0, 0.25) var acceleration := 5.0

var velocity := Vector2.ZERO


func accelerate_in_direction (direction: Vector2, speed := max_speed) -> void:
	var desired_velocity := direction * speed
	velocity = velocity.lerp(desired_velocity, 1 - exp(-acceleration * get_process_delta_time()))


func decelerate () -> void:
	accelerate_in_direction(Vector2.ZERO)


func move (body: CharacterBody2D) -> void:
	body.velocity = velocity
	body.move_and_slide()
	velocity = body.velocity
