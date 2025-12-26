extends Control

@export_file("*.tscn") var coach_creator: String

func _on_exit_pressed():
	get_tree().quit()

func _on_new_game_pressed():
	get_tree().change_scene_to_file(coach_creator)
