extends CanvasLayer

@export var isInGame: bool = false

@onready var settings_menu: CanvasLayer = $SettingsMenu


func _ready() -> void:
	# Visible on Main Menu
	$ButtonsContainer/PlayButton.visible = !isInGame
	$ButtonsContainer/QuitButton.visible = !isInGame
	
	# Visible on game scene
	$ButtonsContainer/ResumeButton.visible = isInGame
	$ButtonsContainer/BackButton.visible = isInGame
	$PausedLabel.visible = isInGame

func _input(event):
	if event.is_action_released("ui_cancel") and isInGame:
		if get_tree().paused: _resume()
		else: _pause()

func _pause() -> void:
	get_tree().paused = true
	visible = true

func _resume() -> void:
	get_tree().paused = false
	visible = false

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")

func _on_resume_button_pressed() -> void:
	_resume()

func _on_settings_button_pressed() -> void:
	settings_menu.show()

func _on_back_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/start_menu/start_menu.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
