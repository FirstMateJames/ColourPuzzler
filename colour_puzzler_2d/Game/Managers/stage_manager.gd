extends Node
class_name StageManager


func _enter_tree() -> void:
	EventSystem.Change_Stage.connect(Change_stage)
	EventSystem.MainMenu.connect(add_main_menu)
	EventSystem.Level_Select.connect(add_level_select)

func _ready() -> void:
	add_main_menu()


func Change_stage(Key : StageConfig.Stages) -> void:
	Delete_Stages()
	add_child(StageConfig.get_stage_node(Key))

func add_main_menu() -> void:
	Delete_Stages()
	add_child(StageConfig.get_main_menu())

func add_level_select() -> void:
	Delete_Stages()
	add_child(StageConfig.get_LEVEL_SELECT())

func Delete_Stages() -> void:
	for child in get_children():
		child.queue_free()
