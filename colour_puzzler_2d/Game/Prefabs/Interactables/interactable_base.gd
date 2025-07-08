@tool
extends Node2D
class_name Interactable

@onready var Visuals: Sprite2D = $Visuals
@export var Interact_on_Collision := false
@export var Colour : ColourConfig.Colours

func _ready() -> void:
	Visuals.self_modulate = ColourConfig.get_color(Colour)

func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		Visuals.self_modulate = ColourConfig.get_color(Colour)

func Interact(Player_Current_Colour) -> void:
	pass


func _on_interactable_area_body_entered(body: Node2D) -> void:
	if Interact_on_Collision:
		Interact(null)
