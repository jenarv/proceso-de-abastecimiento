extends Control

func _on_button_2_pressed() -> void:
	GameData.truck_speed = 10.0
	queue_free()

func _on_button_3_pressed() -> void:
	GameData.truck_speed = 80.0
	queue_free()


func _on_button_reintentar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene2.tscn")
