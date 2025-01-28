extends VBoxContainer

@export var labelAlignment: HorizontalAlignment

@onready var level_label: Label = $LevelLabel
@onready var xp_label: Label = $XPLabel
@onready var level_progress_bar: ProgressBar = $LevelProgressBar

func _ready() -> void:
	level_label.horizontal_alignment = labelAlignment
	xp_label.horizontal_alignment = labelAlignment

func update_ui(level: int, current_xp: int, max_xp: int) -> void:
	level_label.text = "Level: " + str(level)
	xp_label.text = "XP: " + str(current_xp) + " / " + str(max_xp)
	level_progress_bar.value = current_xp
	level_progress_bar.max_value = max_xp
