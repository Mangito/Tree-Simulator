extends Node

enum LANGUAGES {
	EN, 
	PT, 
}

var settings = {
	"language": LANGUAGES.EN,
	"fullscreen": false,
	"brightness": 1,
}

func _ready() -> void:
	set_language(get_language_index(), false)
	set_fullscreen(settings.fullscreen, false)
	set_brightness(settings.brightness, false)

func get_language_index(lang = settings.language) -> int:
	return LANGUAGES.keys().find(lang)

func set_language(value: int, save: bool = true) -> void:
	var key = LANGUAGES.find_key(value)
	settings.language = key
	TranslationServer.set_locale(key)
	if (save): GameStorage.save_progress()

func set_fullscreen(value: bool, save: bool = true) -> void:
	settings.fullscreen = value
	var wMode = DisplayServer.WINDOW_MODE_FULLSCREEN if value else DisplayServer.WINDOW_MODE_WINDOWED
	DisplayServer.window_set_mode(wMode)
	if (save): GameStorage.save_progress()

func set_brightness(value: float, save: bool = true) -> void:
	settings.brightness = value
	if (save): GameStorage.save_progress()
