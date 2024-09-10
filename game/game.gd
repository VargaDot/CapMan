extends Node2D

signal QuitGame

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		QuitGame.emit()
