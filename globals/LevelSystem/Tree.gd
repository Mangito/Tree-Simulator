extends Node

const XP_PER_SECOND: int = 5

var trees = {
	"Tree1": {"id": 0, "name": "Tree 1", "xp": 0, "level": 1, "xpNextLevel": 100, "maxLevel": 3, "asset": "res://assets/trees/deciduous/Tree_small_regular.dae"},
	"Tree2": {"id": 1, "name": "Tree 2", "xp": 0, "level": 1, "xpNextLevel": 100, "maxLevel": 5, "asset": "res://assets/trees/deciduous/Tree_average_regular.dae"},
	"Tree3": {"id": 2, "name": "Tree 3", "xp": 0, "level": 1, "xpNextLevel": 100, "maxLevel": 10, "asset": "res://assets/trees/deciduous/Tree_average_lush.dae"},
}
var selected = "Tree1"

func get_select_tree():
	return trees[selected]

func find_tree_by_id(target_id: int) -> Dictionary:
	for key in trees.keys():
		var tree = trees[key]
		if tree.id == target_id:
			return {"key": key, "tree": tree}
	return {}

func set_selected_tree(name: String) -> void:
	selected = name

func add_xp() -> void:
	var tree = get_select_tree()
	
	tree["xp"] += XP_PER_SECOND
	_check_level_up()

func _check_level_up() -> void:
	var tree = get_select_tree()
	
	if tree.xp >= tree.xpNextLevel: # New Level
		GameManager.coins += tree.level
		tree.xp = 0
		print(selected, " subiu de nível! Novo nível: ", tree.level)
		print("Coins: ", GameManager.coins)
		
		if tree.level < tree.maxLevel: # Check Level Max
			tree.level += 1
			tree.xpNextLevel = Utils.calculate_xp_for_next_level(tree.level)
