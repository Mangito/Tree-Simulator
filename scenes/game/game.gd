extends Node3D

@onready var menu: CanvasLayer = $Menu
@onready var player_level_status: LevelUI = $UI/PlayerLevelUI
@onready var tree_level_status: LevelUI = $UI/TreeLevelUI
@onready var tree_parent = $TreeParent
@onready var camera = $Camera3D


func _ready() -> void:
	_update_ui()
	GameManager.update_tree_model(tree_parent)
	
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
	
