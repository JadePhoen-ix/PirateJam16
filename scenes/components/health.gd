extends Node
class_name Health


var is_dead: bool:
	get:
		return current_health <= 0

var current_health := 10
var max_health := 10

@export_range(0, 100) var base_health := 10
@export_range(0, 100) var scale_factor := 10


func initialize_health (level: int) -> void:
	update_max_health(level)
	current_health = max_health


func update_max_health (level: int) -> void:
	max_health = base_health + (scale_factor * level / 2)


func damage (amount: int) -> void:
	current_health = clampi(current_health - amount, 0, max_health)


func heal (amount: int) -> void:
	current_health = clampi(current_health + amount, 0, max_health)
