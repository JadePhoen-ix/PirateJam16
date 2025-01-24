extends Entity
class_name Player


var current_dash: Dash
var hand_action_held: bool

@onready var augment_manager := $AugmentManager as AugmentManager


func _ready() -> void:
	augment_manager.initialize_manager(self)


func _physics_process(delta: float) -> void:
	if current_dash != null:
		return
	
	var direction := _get_movement_vector().normalized()
	velocity_2d.accelerate_in_direction(direction)
	velocity_2d.move(self)


func _process(delta: float) -> void:
	if hand_action_held:
		augment_manager.trigger_augment_active(Augment.SlotType.HAND)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("mind_active"):
		augment_manager.trigger_augment_active(Augment.SlotType.MIND)
	if event.is_action_pressed("core_active"):
		augment_manager.trigger_augment_active(Augment.SlotType.CORE)
	
	if event.is_action_pressed("hand_active"):
		hand_action_held = true
	elif event.is_action_released("hand_active"):
		hand_action_held = false


func _get_movement_vector() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")
