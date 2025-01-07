extends Node3D

@onready var player_level_status: VBoxContainer = $UI/PlayerLevelUI/PlayerLevelStatus
@onready var tree_level_status: VBoxContainer = $UI/TreeLevelUI/LevelStatus
@onready var tree_name: Label = $UI/TreeLevelUI/TreeName
@onready var tree_selector: OptionButton = $UI/TreeLevelUI/TreeSelector

func _ready() -> void:
	_update_ui()
	_populate_option_button()

func _on_xp_timer_timeout() -> void:
	PlayerLS.add_xp()
	TreeLS.add_xp()
	_update_ui()

func _update_ui() -> void:
	var tree = TreeLS.get_select_tree()
	player_level_status.update_ui(PlayerLS.level, PlayerLS.xp, PlayerLS.xpNextLevel)
	tree_level_status.update_ui(tree["level"], tree["xp"], tree["xpNextLevel"])

func _populate_option_button():
	var TREES = GameManager.TREES
	
	for key in TREES.keys():
		var tree_data = TREES[key]
		tree_selector.add_item(tree_data["name"], key)

func _on_option_button_item_selected(index: int) -> void:
	var TREES = GameManager.TREES
	var seletec = TREES[index]
	
	TreeLS.set_selected_tree(seletec["id"])
	tree_name.text = seletec["name"]
	_update_ui()
