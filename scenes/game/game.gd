extends Node3D

@onready var level_label: Label = $UI/LevelLabel
@onready var level_progress_bar: ProgressBar = $UI/LevelProgressBar

func _ready() -> void:
	_update_ui()

func _on_xp_timer_timeout() -> void:
	Level.add_xp()
	_update_ui()

func _update_ui() -> void:
	level_progress_bar.value = Level.current_xp
	level_progress_bar.max_value = Level.xp_to_next_level
	level_label.text = "Level: " + str(Level.current_level)
