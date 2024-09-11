extends Node

func _ready() -> void:
	ComposerGD.AddScene("MainMenu", "res://main_menu/main_menu.tscn", {
		"instant_create":"true",
		"scene_parent":self
	})
	await Composer.SceneCreated
	
	get_child(1).PlayGame.connect(_play_game)
	
	ComposerGD.AddScene("Game", "res://game/game.tscn", {
		"scene_parent":self
	})

var transToMainMenu:bool
func _play_game():
	ComposerGD.ReplaceScene("MainMenu", "Game", self)
	transToMainMenu = false
	$Timer.start()

func _quit_game():
	ComposerGD.ReplaceScene("Game", "MainMenu", self)
	transToMainMenu = true
	$Timer.start()

func _on_timer_timeout() -> void:
	if transToMainMenu == false:
		get_child(1).QuitGame.connect(_quit_game) 
	else:
		get_child(1).PlayGame.connect(_play_game)
