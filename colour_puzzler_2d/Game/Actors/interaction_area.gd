extends Area2D

@onready var Parent := get_parent() as Player_Controller

func _input(event: InputEvent) -> void:
	if get_overlapping_areas().size() > 0:
		var interactable_area = get_overlapping_areas()[0].get_parent() as Interactable
		if Input.is_action_just_pressed("Interact"):
			interactable_area.Interact(Parent.Colour)
