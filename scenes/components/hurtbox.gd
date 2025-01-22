extends Area2D
class_name Hurtbox


@export_group("Node References")
@export var health: Health


func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(other_area: Area2D) -> void:
	if not other_area is Hitbox:
		return
	
	if !health:
		push_error("MISSING REFERNCE: Health node not found")
		return
	
	var hitbox := other_area as Hitbox
	health.damage(hitbox.damage)
