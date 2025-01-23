extends Node
class_name Augment


enum SlotType {
	HAND,
	MIND,
	CORE
}

@export var slot_type := SlotType.HAND

var manager: AugmentManager
var entity: Entity:
	get: return manager.entity


func _active() -> void: pass


func _passive() -> void: pass
