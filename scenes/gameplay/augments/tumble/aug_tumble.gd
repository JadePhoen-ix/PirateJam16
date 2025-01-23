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
	
	var data := {
			direction = get_direction_vector(),
			duration = 0.25,
			speed = entity.velocity_2d.max_speed * speed_multiplier,
			velocity_2d = entity.velocity_2d,
			body = entity
	}
	entity.current_dash = Dash.create(data)
	cooldown_timer = get_tree().create_timer(cooldown)


func get_direction_vector() -> Vector2:
	#return entity.get_global_mouse_position() - entity.global_position
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")
