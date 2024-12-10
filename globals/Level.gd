extends Node

var current_xp: int = 0
var current_level: int = 1
const XP_PER_SECOND: int = 5
var xp_to_next_level: int = 100

func add_xp() -> void:
	current_xp += XP_PER_SECOND
	print("current_xp: ", current_xp)
	print("current_level: ", current_level)
	print("xp_to_next_levelXP: ", xp_to_next_level)
	_check_level_up()

func _check_level_up() -> void:
	if current_xp >= xp_to_next_level:
		current_xp -= xp_to_next_level
		current_level += 1
		xp_to_next_level = _calculate_xp_for_next_level(current_level)
		_on_level_up()

func _calculate_xp_for_next_level(level: int) -> int:
	return (level + 1) * 100

func _on_level_up() -> void:
	print("Level Up! Current Level: ", current_level)
