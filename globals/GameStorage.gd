extends Node

const SAVE_PATH = "user://savegame.json" # C:\Users\username\AppData\Roaming\Godot\app_userdata\Tree Simulator

func _ready() -> void:
	load_progress()
	save_progress()

func save_progress():
	var data = {
		"player": PlayerLS.get_data(),
		"trees": TreeLS.trees,
		"selectedTree": TreeLS.selected,
		"coins": GameManager.coins,
	}
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var jsonData = JSON.stringify(data)
	
	file.store_line(jsonData)

func load_progress():
	if not FileAccess.file_exists(SAVE_PATH):
		print("Save file not exists")
		return
		
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var file_content = file.get_as_text()
	var json = JSON.new()
	
	json.parse(file_content)
	
	var data = json.data
	
	TreeLS.trees = data.trees
	TreeLS.selected = data.selectedTree
	PlayerLS.xp = data.player.xp
	PlayerLS.level = data.player.level
	PlayerLS.xpNextLevel = data.player.xpNextLevel
	GameManager.coins = data.coins
	
