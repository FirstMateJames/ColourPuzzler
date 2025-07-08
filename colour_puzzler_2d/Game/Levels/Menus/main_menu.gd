extends Node


func _on_play_pressed() -> void:
	EventSystem.Level_Select.emit()
