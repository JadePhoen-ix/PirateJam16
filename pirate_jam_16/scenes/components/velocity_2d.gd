extends Node
class_name Velocity2D


@export var max_speed := 40.0
@export var acceleration := 5.0

var velocity := Vector2.ZERO


func accelerate_in_direction (direction: Vector2) -> void:
	var desired_velocity := direction * max_speed
	velocity = velocity.lerp(desired_velocity, 1 - exp(-acceleration * get_process_delta_time()))


func decelerate () -> void:
	accelerate_in_direction(Vector2.ZERO)


func move (body: CharacterBody2D) -> void:
	body.velocity = velocity
	body.move_and_slide()
	velocity = body.velocity