extends "res://scenes/level_ui/level_ui.gd"

@onready var coins_label: Label = $CoinsLabel

func _update_coin(coin: int) -> void:
	coins_label.text = tr("COINS").format({ "coins": str(coin) })
