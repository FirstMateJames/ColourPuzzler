extends TextureRect
class_name Level_select_button

var Level_Key


func set_Key(Key : StageConfig.Stages) -> void:
	if Level_Key != null:
		return
	
	Level_Key = Key

func _on_button_pressed() -> void:
	EventSystem.Change_Stage.emit(Level_Key)
