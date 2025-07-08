@tool
extends Interactable
class_name Teleporter

@export var end_position : Teleporter

func Interact(Player_Current_Colour) -> void:
	if Player_Current_Colour == null or end_position == null:
		return
	
	if Player_Current_Colour == Colour:
		EventSystem.teleport_player.emit(end_position.global_position)
		EventSystem.change_colour.emit(end_position.Colour)
