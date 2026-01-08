extends Resource
class_name ClubResource

@export var db_id: int = -1
@export var name: String = ""
@export var short_name: String = ""
@export_range(1,50,1) var force:int = -1
@export var squad_base:Array[PlayerBaseData] = []
@export var country:CountryResource = null
@export var logo:Texture2D = null
@export var arena:String = ""
