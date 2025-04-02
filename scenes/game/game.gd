extends Node3D

@onready var menu: CanvasLayer = $Menu
@onready var player_level_status: VBoxContainer = $UI/PlayerLevelUI/PlayerLevelStatus
@onready var tree_level_status: VBoxContainer = $UI/TreeLevelUI/LevelStatus
@onready var tree_name: Label = $UI/TreeLevelUI/TreeName
@onready var tree_selector: OptionButton = $UI/TreeLevelUI/TreeSelector

func _ready() -> void:
	_update_ui()
	_populate_option_button()
	
	menu.visible = false

func _on_xp_timer_timeout() -> void:
	PlayerLS.add_xp()
	TreeLS.add_xp()
	_update_ui()
	GameStorage.save_progress()

func _update_ui() -> void:
	var tree = TreeLS.get_select_tree()
	player_level_status.update_ui(PlayerLS.level, PlayerLS.xp, PlayerLS.xpNextLevel)
	tree_level_status.update_ui(tree["level"], tree["xp"], tree["xpNextLevel"])

func _populate_option_button():
	var TREES = TreeLS.trees
	var selected = TreeLS.selected
	
	for key in TREES.keys():
		var tree = TREES[key]
		tree_selector.add_item(tree.name, tree.id)
	
	tree_selector.selected = TREES[selected].id

func _on_option_button_item_selected(index: int) -> void:
	var seletec = TreeLS.find_tree_by_id(index)
	
	TreeLS.set_selected_tree(seletec.key)
	tree_name.text = seletec.tree.name
	
	_update_ui()
	GameStorage.save_progress()
