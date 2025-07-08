class_name StageConfig

enum Stages {
	TestLevel,
	Level_1
}

const GET_STAGE_NODE := {
	Stages.TestLevel : "res://Game/Levels/test_level.tscn"
}


static func get_stage_node(Scene : Stages) -> Node:
	return load(GET_STAGE_NODE.get(Scene)).instantiate()



const GET_MAIN_MENU = "res://Game/Levels/Menus/MainMenu.tscn"
const GET_LEVEL_SELECT = "res://Game/Levels/Menus/Level_Select.tscn"


static func get_main_menu() -> Node:
	return load(GET_MAIN_MENU).instantiate()

static func get_LEVEL_SELECT() -> Node:
	return load(GET_LEVEL_SELECT).instantiate()
