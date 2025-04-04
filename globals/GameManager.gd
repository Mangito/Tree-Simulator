extends Node

enum LANGUAGES {
	EN, 
	PT, 
}

var coins = 0
var settings = {
	"language": "EN",
	"fullscreen": false,
}
var tree_parent = null

func _ready() -> void:
	set_language(get_language_index(), false)
	set_fullscreen(settings.fullscreen, false)

func get_language_index(lang = settings.language) -> int:
	return LANGUAGES.keys().find(lang)

func set_language(value: int, save: bool = true) -> void:
	var key = LANGUAGES.find_key(value)
	settings.language = key
	TranslationServer.set_locale(key)
	if (save): GameStorage.save_progress()

func set_fullscreen(value: bool, save: bool = true) -> void:
	settings.fullscreen = value
	var wMode = DisplayServer.WINDOW_MODE_FULLSCREEN if value else DisplayServer.WINDOW_MODE_WINDOWED
	DisplayServer.window_set_mode(wMode)
	if (save): GameStorage.save_progress()

func update_tree_model(parent: Node3D):
	if parent != null:
		tree_parent = parent
	
	var tree = TreeLS.get_select_tree()
	var tree_asset = tree["asset"]
	
	if tree_parent != null && tree_asset:
		# Loop through all the children of tree_parent and hide/show as needed
		for child in tree_parent.get_children():
			if child.name == tree_asset:
				child.visible = true  # Only show the matching tree
			else:
				child.visible = false  # Hide all others
