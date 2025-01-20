extends Node
class_name Augment


enum SlotType {
	HAND,
	MIND,
	CORE
}

@export var slot_type := SlotType.HAND

var manager: AugmentManager


func active() -> void:
	push_warning("ACTIVE UNIMPLEMENTED WARNING: Active unimplemented.")


func passive() -> void:
	push_warning("PASSIVE UNIMPLEMENTED WARNING: Passive unimplemented.")
