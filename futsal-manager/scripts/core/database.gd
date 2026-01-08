extends Node
class_name Database

var next_club_id: int = 1
var clubs: Array[ClubResource] = []
var clubs_by_id: Dictionary = {}

const DEFAULT_PATH = "res://data/default"
const CLUBS_FOLDER = "/clubs"

func load_default_data()-> void:
	_load_from_path(DEFAULT_PATH)
	
func get_all_clubs() -> Array[ClubResource]:
	return clubs
	
func get_club_by_id(id: int) -> ClubResource:
	return clubs_by_id.get(id, null)
	
func _load_from_path(base_path: String) -> void:
	_reset_world()
	var clubs_path := base_path + CLUBS_FOLDER
	if not DirAccess.dir_exists_absolute(clubs_path):
		push_error("Database: clubs directory not found -> " + clubs_path)
		return
		
	var dir := DirAccess.open(clubs_path)
	if dir == null:
		push_error("Database: failed to open clubs directory")
		return
	
	dir.list_dir_begin()
	while true:
		var file_name := dir.get_next()
		if file_name == "":
			break
		if file_name == "." or file_name == "..":
			continue
		if dir.current_is_dir():
			continue
		if not file_name.ends_with(".tres"):
			continue
			
		var full_path := clubs_path + "/" + file_name
		_load_club_resource(full_path)
	dir.list_dir_end()

func _load_club_resource(path: String) -> void:
	var resource := load(path)
	if resource == null:
		push_error("Database: failed to load resource -> " + path)
		return
	if not resource is ClubResource:
		push_error("Database: resource isn't ClubResource -> " + path)
		return
		
	var club := resource as ClubResource
	_register_club(club)

func _register_club(club: ClubResource) -> void:
	club.db_id = next_club_id
	next_club_id += 1
	clubs.append(club)
	clubs_by_id[club.db_id] = club

func _reset_world():
	next_club_id = 1
	clubs.clear()
	clubs_by_id.clear()
