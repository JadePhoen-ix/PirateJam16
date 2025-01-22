extends Node
class_name Level


var current_threshold: int:
	get:
		return base_threshold + (scale_factor * current_level)

var current_experience := 0.0
var current_level := 1

@export_range(0, 100) var base_threshold := 10
@export_range(0, 100) var scale_factor := 10


func gain(amount: float) -> void:
	current_experience += amount
	if current_experience >= current_threshold:
		current_experience -= current_threshold
		increment_level()


func increment_level(amount := 1) -> void:
	current_level += amount
