extends CanvasLayer

@onready var lang_option_button: OptionButton = $ButtonsContainer/LanguageContainer/LangOptionButton
@onready var full_screen_check_button: CheckButton = $ButtonsContainer/FullScreenContainer/FullScreenCheckButton
@onready var bright_slider: HSlider = $ButtonsContainer/BrightnessContainer/BrightSlider

func _ready() -> void:
	lang_option_button.selected = GameManager.LANGUAGES.keys().find(GameManager.settings.language)
	full_screen_check_button.button_pressed = GameManager.settings.fullscreen
	bright_slider.value = GameManager.settings.brightness

func _on_lang_option_button_item_selected(index: int) -> void:
	GameManager.settings.language = GameManager.LANGUAGES.find_key(index)
	GameStorage.save_progress()

func _on_full_screen_check_button_toggled(toggled_on: bool) -> void:
	GameManager.settings.fullscreen = toggled_on
	var wMode = DisplayServer.WINDOW_MODE_FULLSCREEN if toggled_on else DisplayServer.WINDOW_MODE_WINDOWED
	DisplayServer.window_set_mode(wMode)
	GameStorage.save_progress()

func _on_bright_slider_drag_ended(value_changed: bool) -> void:
	GameManager.settings.brightness = value_changed
	GameStorage.save_progress()

func _on_back_button_pressed() -> void:
	hide()
