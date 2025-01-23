extends Augment
class_name AugPistol


@export_range(0.0, 10.0, 0.1) var fire_rate := 1.0

const PROJECTILE_SCENE := preload("res://scenes/gameplay/projectiles/projectile.tscn")

var fire_rate_timer: SceneTreeTimer


func _active() -> void:
	if fire_rate_timer != null and fire_rate_timer.time_left > 0.0:
		return
	
	var spawn_position := entity.global_position
	var direction := entity.get_global_mouse_position() - entity.global_position
	
	var projectile := PROJECTILE_SCENE.instantiate() as Projectile
	add_child(projectile)
	projectile.global_position = spawn_position
	projectile.look_at(entity.to_global(direction))
	
	fire_rate_timer = get_tree().create_timer(fire_rate)
