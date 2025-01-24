extends RefCounted
class_name Cooldown


signal timeout()

var active: bool:
	get: return time_left > 0.0

var time_left: float


func _init(duration: float) -> void:
	time_left = duration
	start()


func start() -> void:
	while(active):
		# Global can be any AutoLoad class, is used only to access the SceneTree
		time_left -= Global.get_process_delta_time()
		await Global.get_tree().process_frame
	
	timeout.emit()
