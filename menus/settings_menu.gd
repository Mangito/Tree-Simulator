extends CanvasLayer

@onready var lang_option_button: OptionButton = $ButtonsContainer/LanguageContainer/LangOptionButton
@onready var full_screen_check_button: CheckButton = $ButtonsContainer/FullScreenContainer/FullScreenCheckButton

func _ready() -> void:
	lang_option_button.selected = GameManager.get_language_index()
	full_screen_check_button.button_pressed = GameManager.settings.fullscreen

func _on_lang_option_button_item_selected(index: int) -> void:
	GameManager.set_language(index)

func _on_full_screen_check_button_toggled(toggled_on: bool) -> void:
	GameManager.set_fullscreen(toggled_on)

func _on_back_button_pressed() -> void:
	hide()
