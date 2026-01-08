extends Control

#Data
@export var first_name_input: LineEdit
@export var last_name_input: LineEdit
@export var age_input: SpinBox
@export var continue_button: Button

#Variables
const MIN_NAME_LENGTH = 3

func _ready():
	continue_button.disabled = true
	first_name_input.text_changed.connect(_on_input_changed)
	last_name_input.text_changed.connect(_on_input_changed)
	age_input.value_changed.connect(_on_age_changed)

func _on_input_changed(_new_text:String):
	_validate_inputs()

func _on_age_changed(_new_value:float):
	_validate_inputs()
	
func _validate_inputs():
	var first_name := first_name_input.text.strip_edges().length() >= MIN_NAME_LENGTH
	var last_name := last_name_input.text.strip_edges().length() >= MIN_NAME_LENGTH
	var age_valid := age_input.value >= 18
	
	if first_name and last_name and age_valid:
		continue_button.disabled = false
	else:
		continue_button.disabled = true

func _on_continue_pressed():
	continue_button.disabled = true
	
	var coach_data = {
		"first_name": first_name_input.text.strip_edges(),
		"last_name": last_name_input.text.strip_edges(),
		"age": int(age_input.value)
	}
	GameSetup.create_coach(coach_data)
	SceneManager.go_to_select_club()

func _on_back_pressed():
	SceneManager.go_to_main_menu()
