@tool
extends CharacterBody2D
class_name Player_Controller

@export var Speed := 200.0
var Jump_Buffer_Counter := 0
var Cayote_Counter := 0

const JUMP_BUFFER_TIME := 15
const CAYOTE_TIME := 15

@export var Jump_Height := 250.0

@export var Dampening := 750.0

@export var Colour : ColourConfig.Colours
@onready var Visuals: Sprite2D = $Visuals

func _enter_tree() -> void:
	EventSystem.change_colour.connect(change_colour)
	EventSystem.teleport_player.connect(change_position)

func _ready() -> void:
	change_colour(Colour)

func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		change_colour(Colour)

func _physics_process(delta: float) -> void:
	if !Engine.is_editor_hint():
		apply_gravity(delta)
		jump_handle()
		move(delta)

func apply_gravity(delta : float) -> void:
	if !is_on_floor():
		velocity.y += get_gravity().y * delta

func move(delta : float) -> void:
	
	var Direction := Input.get_axis("move_left","move_right")
	
	if Direction:
		velocity.x = move_toward(velocity.x, Direction * Speed,Dampening *  delta)
	else:
		if is_on_floor():
			velocity.x = move_toward(velocity.x , 0 , Dampening * delta)
		else:
			velocity.x = lerpf(velocity.x,0,1 * delta)
	move_and_slide()

func cayote_handle() -> void:
	if is_on_floor():
		Cayote_Counter = CAYOTE_TIME
	else:
		if Cayote_Counter > 0:
			Cayote_Counter -= 1

func jump_buffer_handle() -> void:
	if Input.is_action_just_pressed("Jump"):
		Jump_Buffer_Counter = JUMP_BUFFER_TIME
	
	if Jump_Buffer_Counter > 0:
		Jump_Buffer_Counter -= 1

func jump_handle() -> void:
	
	cayote_handle()
	jump_buffer_handle()
	
	if Jump_Buffer_Counter > 0 and Cayote_Counter > 0:
		velocity.y = -Jump_Height
		Cayote_Counter = 0
		Jump_Buffer_Counter = 0


func change_colour(COLOUR : ColourConfig.Colours) -> void:
	Visuals.self_modulate = ColourConfig.get_color(COLOUR)
	Colour = COLOUR


func change_position(pos : Vector2) -> void:
	global_position = pos
