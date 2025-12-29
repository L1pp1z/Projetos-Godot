extends Node

signal coach_created(coach: CoachResource)
var active_coach: CoachResource

func create_coach(data: Dictionary):
	var coach := CoachResource.new()
	coach.first_name = data["first_name"]
	coach.last_name = data["last_name"]
	coach.age = data["age"]
	active_coach = coach
	emit_signal("coach_created", coach)
