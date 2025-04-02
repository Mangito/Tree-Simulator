extends CanvasLayer

func _on_option_button_item_selected(index: int) -> void:
	pass

func _on_check_button_toggled(toggled_on: bool) -> void:
	var wMode = DisplayServer.WINDOW_MODE_FULLSCREEN if toggled_on else DisplayServer.WINDOW_MODE_WINDOWED
	DisplayServer.window_set_mode(wMode)

func _on_h_slider_drag_ended(value_changed: bool) -> void:
	pass

func _on_back_button_pressed() -> void:
	hide()
