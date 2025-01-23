extends CharacterBody2D
class_name Projectile


@onready var hitbox := $Hitbox as Hitbox
@onready var velocity_2d := $Velocity2D as Velocity2D


func _process(delta: float) -> void:
	var direction := (to_global(Vector2.RIGHT) - global_position).normalized()
	velocity_2d.accelerate_in_direction(direction)
	velocity_2d.move(self)


func set_values(damage: float, speed: float, acceleration := velocity_2d.acceleration) -> void:
	hitbox.set_damage(damage)
	velocity_2d.max_speed = speed
	velocity_2d.acceleration = acceleration
