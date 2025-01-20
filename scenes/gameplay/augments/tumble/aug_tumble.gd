extends Augment
class_name AugTumble


@export_group("Tumble Parameters")
@export_range(0.0, 10.0, 0.1) var duration := 0.25
@export_range(0.0, 10.0, 0.1) var speed_multiplier := 2.0
@export_range(0.0, 10.0, 0.1) var cooldown := 5.0

var cooldown_timer: SceneTreeTimer


func _active() -> void:
	if cooldown_timer != null and cooldown_timer.time_left > 0.0:
		print_rich("[color=red]Tumble currently on cooldown.[/color]")
		return
	
	var entity := manager.entity as Player
	var data := {
			direction = entity.get_global_mouse_position() - entity.global_position,
			duration = 0.25,
			speed = entity.velocity_2d.max_speed * 5.0,
			velocity_2d = entity.velocity_2d,
			body = entity
	}
	entity.current_dash = Dash.create(data)
	cooldown_timer = get_tree().create_timer(cooldown)
