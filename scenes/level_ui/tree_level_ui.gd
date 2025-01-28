extends "res://scenes/level_ui/level_ui.gd"

@onready var title: Label = $Title
@onready var tree_selector: OptionButton = $TreeSelector

func _start() -> void:
	_populate_option_button()

func _populate_option_button() -> void:
	var TREES = TreeLS.trees
	var selected = TreeLS.selected
	
	for key in TREES.keys():
		var tree = TREES[key]
		tree_selector.add_item(tree.name, tree.id)
	
	tree_selector.selected = TREES[selected].id

func _on_tree_selector_item_selected(index: int) -> void:
	var seletec = TreeLS.find_tree_by_id(index)
	
	TreeLS.set_selected_tree(seletec.key)
	title.text = seletec.tree.name
	
	update_ui(seletec.tree.level, seletec.tree.xp, seletec.tree.xpNextLevel)
