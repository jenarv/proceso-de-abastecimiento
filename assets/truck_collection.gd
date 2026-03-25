extends CharacterBody3D
@export var target: Node3D
@onready var game_over_label = $CanvasLayer/Label
@onready var docked_label = $CanvasLayer/LabelDocked
@onready var retry_button = $CanvasLayer/ButtonReintentar
var game_over = false
var docked = false

func _physics_process(delta):
	if game_over or docked:
		return
	var speed = GameData.truck_speed
	var direction = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	elif Input.is_action_pressed("ui_down"):
		direction.z += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	elif Input.is_action_pressed("ui_right"):
		direction.x += 1
	velocity = direction * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		game_over = true
		game_over_label.visible = true
		await get_tree().create_timer(2.0).timeout
		retry_button.visible = true  # ← aparece después de 2 segundos
	if target:
		var distance = global_position.distance_to(target.global_position)
		if distance < 1.0:
			docked = true
			docked_label.visible = true
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://scenes/scene3.tscn")


func _on_button_reintentar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene2.tscn")
