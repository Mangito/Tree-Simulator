extends Node3D

@onready var menu: CanvasLayer = $Menu
@onready var player_level_status: LevelUI = $UI/PlayerLevelUI
@onready var tree_level_status: LevelUI = $UI/TreeLevelUI
@onready var tree_parent = $TreeParent
@onready var camera = $Camera3D


func _ready() -> void:
	_update_ui()
	
	camera.current = true
	menu.visible = false

func _on_xp_timer_timeout() -> void:
	PlayerLS.add_xp()
	TreeLS.add_xp()
	_update_ui()
	GameStorage.save_progress()

func update_tree_model():
	for child in tree_parent.get_children():
		child.queue_free()
	
	# Load and instance the new tree
	var tree = TreeLS.get_select_tree() 
	var tree_scene = load(tree["asset"])
	if tree_scene:
		var tree_instance = tree_scene.instantiate()
		tree_parent.add_child(tree_instance)
		match tree["name"]: #All assets have different sizes so we need to change its placing
			"Tree 1":
				tree_instance.position = Vector3(-7.745, 0, -10.357)
			"Tree 2":
				tree_instance.position = Vector3(50.982, 0, -9.077)
			"Tree 3":
				tree_instance.position = Vector3(33.712, 0, -9.771)
		

func _update_ui() -> void:
	var tree = TreeLS.get_select_tree()
	player_level_status.update_ui(PlayerLS.level, PlayerLS.xp, PlayerLS.xpNextLevel)
	tree_level_status.update_ui(tree["level"], tree["xp"], tree["xpNextLevel"])
	
	update_tree_model()
