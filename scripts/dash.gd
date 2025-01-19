extends Node
class_name Dash


#signal dash_started()
#signal dash_finished()

var direction: Vector2
var duration: float
var speed: float
var velocity_2d: Velocity2D
var body: CharacterBody2D


static func create(data: Dictionary) -> Dash:
	var new_dash := Dash.new()
	
	if not data.has("direction"):
		push_error("MISSING PARAMETER ERROR: dash.gd: No direction found in data Dictionary")
	new_dash.direction = data.direction.normalized()
	
	if not data.has("duration"):
		push_error("MISSING PARAMETER ERROR: dash.gd: No duration found in data Dictionary")
	new_dash.duration = data.duration
	
	if not data.has("speed"):
		push_error("MISSING PARAMETER ERROR: dash.gd: No speed found in data Dictionary")
	new_dash.speed = data.speed
	
	if not data.has("velocity_2d"):
		push_error("MISSING PARAMETER ERROR: dash.gd: No velocity_2d found in data Dictionary")
	new_dash.velocity_2d = data.velocity_2d
	
	if not data.has("body"):
		push_error("MISSING PARAMETER ERROR: dash.gd: No body found in data Dictionary")
	new_dash.body = data.body
	
	new_dash._start()
	return new_dash


func _tween_method(progress: float) -> void:
	velocity_2d.accelerate_in_direction(direction, speed)
	velocity_2d.move(body)


func _start() -> void:
	if velocity_2d == null:
		return
	
	var tween := velocity_2d.create_tween()
	tween.tween_method(_tween_method, 0.0, 1.0, duration)
	
	await tween.finished
	queue_free()
