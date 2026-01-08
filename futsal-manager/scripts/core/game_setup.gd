extends Node

func create_coach(data: Dictionary) -> CoachResource:
	assert(data.has("first_name"))
	assert(data.has("last_name"))
	assert(data.has("age"))
	
	var coach := CoachResource.new()
	coach.first_name = data.get("first_name", "")
	coach.last_name = data.get("last_name", "")
	coach.age = data.get("age", 0)
	coach.gender = data.get("gender", "")
	coach.country = data.get("country", "")

	GameState.active_coach = coach
	return coach
