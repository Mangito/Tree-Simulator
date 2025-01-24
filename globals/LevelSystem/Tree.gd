extends Node

const XP_PER_SECOND: int = 5

var trees = {
	"Tree1": {"id": 0, "name": "Tree 1", "xp": 0, "level": 1, "xpNextLevel": 100, "maxLevel": 10},
	"Tree2": {"id": 1, "name": "Tree 2", "xp": 0, "level": 1, "xpNextLevel": 100, "maxLevel": 10},
	"Tree3": {"id": 2, "name": "Tree 3", "xp": 0, "level": 1, "xpNextLevel": 100, "maxLevel": 10},
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
	
	if tree["level"] < tree["maxLevel"]: # Check Level Max
		if tree["xp"] >= tree["xpNextLevel"]: # New Level
			tree["xp"] -= tree["xpNextLevel"]
			tree["level"] += 1
			tree["xpNextLevel"] = Utils.calculate_xp_for_next_level(tree["level"])

func _on_level_up() -> void:
	var tree = get_select_tree()
	print(selected, " subiu de nível! Novo nível: ", tree["level"])
