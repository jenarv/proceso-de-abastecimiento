extends Node

@onready var panel_error = $CanvasLayer/panel_error
@onready var panel_correcto = $CanvasLayer/panel_correcto
@onready var label_pregunta = $CanvasLayer/Label

const FRASCO_CORRECTO = "A"

func _ready():
	panel_error.visible = false
	panel_correcto.visible = false

func _on_izquierda_pressed():
	evaluar_respuesta("A")

func _on_derecha_pressed():
	evaluar_respuesta("B")

func evaluar_respuesta(eleccion: String):
	if eleccion == FRASCO_CORRECTO:
		GameState.prueba_visible_ok = true
		# Ocultar botones y mostrar panel correcto
		label_pregunta.visible = false
		$CanvasLayer/izquierda.visible = false
		$CanvasLayer/derecha.visible = false
		panel_correcto.visible = true
		# Esperar 2 segundos y pasar a la siguiente escena
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://scenes/scene3.tscn")
	else:
		panel_error.visible = true
		label_pregunta.visible = false
		$CanvasLayer/izquierda.visible = false
		$CanvasLayer/derecha.visible = false

func _on_button_reintentar_pressed():
	GameState.reset()
	get_tree().change_scene_to_file("res://scenes/scene1.tscn")
