extends Area2D
class_name Hitbox


@export_range(0.0, 100.0, 0.5) var damage := 1.0


func set_damage(value: float) -> void:
	damage = value
