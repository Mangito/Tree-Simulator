extends Node

const XP_PER_SECOND: int = 5

var xp = 0 # Current XP
var level = 1 # Current Level
var xpNextLevel = 100 # XP to the next level

func add_xp() -> void:
	xp += XP_PER_SECOND
	_check_level_up()

func _check_level_up() -> void:
	if xp >= xpNextLevel:
		xp -= xpNextLevel
		level += 1
		xpNextLevel = Utils.calculate_xp_for_next_level(level)
		_on_level_up()

func _on_level_up() -> void:
	print("Level Up! Current Level: ", level)
