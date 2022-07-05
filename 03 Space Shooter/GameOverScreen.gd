extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var highscoreLabel = $HighscoreLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	set_highscore_label()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("ui_cancel"):
		get_tree().change_scene("res://StartMenu.tscn")

func set_highscore_label():
	var save_data = SaveLoad.load_data_from_file()
	highscoreLabel.text = "Highscore: " + str(save_data.highscore)
