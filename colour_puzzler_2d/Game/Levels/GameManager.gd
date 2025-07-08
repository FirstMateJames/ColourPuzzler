extends Node
class_name GameManager

@export var Next_Level : StageConfig.Stages


func _enter_tree() -> void:
	EventSystem.End_Level_Check.connect(check_game_state)

func are_blocks_gone() -> bool:
	return get_tree().get_nodes_in_group("Block").size() <= 0

func check_game_state() -> void:
	if are_blocks_gone():
		print("Level_Complete")
