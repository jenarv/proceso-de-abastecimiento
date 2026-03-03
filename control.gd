extends Control

func _on_button_pressed() -> void:
	GameData.truck_speed = 3.0
	queue_free()

func _on_button_2_pressed() -> void:
	GameData.truck_speed = 10.0
	queue_free()

func _on_button_3_pressed() -> void:
	GameData.truck_speed = 80.0
	queue_free()
