extends Node

func _ready() -> void:
	ComposerGD.AddScene("MainMenu", "res://main_menu/main_menu.tscn", {
		"instant_create":"true",
		"scene_parent":self
	})
	await Composer.SceneCreated
	
	ComposerGD.AddScene("Game", "res://game/game.tscn", {
		"scene_parent":self
	})
