extends Control

func _on_exit_pressed():
	get_tree().quit()

func _on_new_game_pressed():
	SceneManager.go_to_coach_creator()
