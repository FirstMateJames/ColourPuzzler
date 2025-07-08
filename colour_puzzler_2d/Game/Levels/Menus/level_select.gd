extends Node


const Level_Button := preload("res://Game/Levels/Menus/Level_select_button.tscn")
@onready var level_buttons: GridContainer = %Level_Buttons

func _ready() -> void:
	add_level_select_buttons()

func add_level_select_buttons() -> void:
	for LEVEL in StageConfig.Stages.size():
		var LEVEL_BUTTON := Level_Button.instantiate() as Level_select_button
		level_buttons.add_child(LEVEL_BUTTON)
		LEVEL_BUTTON.set_Key(LEVEL)
