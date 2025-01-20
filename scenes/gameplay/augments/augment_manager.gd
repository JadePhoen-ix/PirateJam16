extends Node
class_name AugmentManager


var hand_augment: Augment
var core_augment: Augment
var mind_augment: Augment


func remove_augment(augment: Augment) -> void:
	if !get_children().has(augment):
		push_error("AUGMENT NOT FOUND: Augment to remove not found in children")
		return
	
	match augment.slot_type:
		Augment.SlotType.HAND:
			hand_augment = null
		Augment.SlotType.CORE:
			core_augment = null
		Augment.SlotType.MIND:
			mind_augment = null
	remove_child(augment)


func set_augment(augment: Augment) -> void:
	if get_children().has(augment):
		push_warning("AUGMENT FOUND: Augment to add already in children, cancelling action")
		return
	
	match augment.slot_type:
		Augment.SlotType.HAND:
			if hand_augment: remove_augment(hand_augment)
			hand_augment = augment
		Augment.SlotType.CORE:
			if core_augment: remove_augment(core_augment)
			core_augment = augment
		Augment.SlotType.MIND:
			if mind_augment: remove_augment(mind_augment)
			mind_augment = augment
	
	augment.manager = self
	add_child(augment)


func trigger_augment_active(slot: Augment.SlotType) -> void:
	match slot:
		Augment.SlotType.HAND:
			if !hand_augment: return
			hand_augment.active()
		Augment.SlotType.CORE:
			if !core_augment: return
			core_augment.active()
		Augment.SlotType.MIND:
			if !mind_augment: return
			mind_augment.active()
