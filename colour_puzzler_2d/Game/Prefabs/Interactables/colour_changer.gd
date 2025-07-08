@tool
extends Interactable


func Interact(Player_Current_Colour) -> void:
	EventSystem.change_colour.emit(Colour)
