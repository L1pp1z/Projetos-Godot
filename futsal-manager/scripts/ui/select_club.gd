extends Control

@export_file("*.tscn") var coach_creator

@export var select_club_button: Button

# Called when the node enters the scene tree for the first time.
func _ready():
	select_club_button.disabled = true

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file(coach_creator)
