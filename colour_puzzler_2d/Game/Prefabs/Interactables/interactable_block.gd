@tool
extends Interactable


func Interact(Player_Current_Colour) -> void:
	if Player_Current_Colour == null:
		return
	
	if Player_Current_Colour == Colour:
		queue_free()
