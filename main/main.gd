extends Node

func _ready() -> void:
	ComposerGD.AddScene("MainMenu", "res://main_menu/main_menu.tscn", {
		"instant_create":"true",
		"scene_parent":self
	})
	await Composer.SceneCreated
	
	get_child(0).PlayGame.connect(_play_game)
	
	ComposerGD.AddScene("Game", "res://game/game.tscn", {
		"scene_parent":self
	})

func _play_game():
	ComposerGD.ReplaceScene("MainMenu", "Game", self)
	await Composer.SceneReplaced
	get_child(0).QuitGame.connect(_quit_game)

func _quit_game():
	ComposerGD.ReplaceScene("Game", "MainMenu", self)
	await Composer.SceneReplaced
	get_child(0).PlayGame.connect(_play_game)
