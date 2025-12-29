extends Node

const MAIN_MENU = preload("res://scenes/ui/main_menu.tscn")
const COACH_CREATOR = preload("res://scenes/ui/coach_creator.tscn")
const SELECT_CLUB = preload("res://scenes/ui/select_club.tscn")

func go_to_main_menu():
	get_tree().change_scene_to_packed(MAIN_MENU)

func go_to_coach_creator():
	get_tree().change_scene_to_packed(COACH_CREATOR)
	
func go_to_select_club():
	get_tree().change_scene_to_packed(SELECT_CLUB)
