extends Node

const SAVE_DATA_PATH = "res://save_data.json"

var default_save_Data = \
{
	highscore = 0
}



# Called when the node enters the scene tree for the first time.
func _ready():
	print("default highscore: " + str(default_save_Data))
	
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.READ)
	var save_data = parse_json(save_file.get_as_text())
	save_file.close()
	
	if save_file.file_exists(SAVE_DATA_PATH):
		print("Real highscore: " + str(save_data))

func save_data_to_file(save_data):
	var json_string = to_json(save_data)
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE_READ)
	save_file.store_line(json_string)
	save_file.close()

func load_data_from_file():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		return default_save_Data
		
	save_file.open(SAVE_DATA_PATH, File.READ)
	var save_data = parse_json(save_file.get_as_text())
	save_file.close()
	return save_data
	
