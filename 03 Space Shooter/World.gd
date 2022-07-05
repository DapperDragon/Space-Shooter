extends Node


var score = 0 setget set_score



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_score(value):
	score = value
	update_score_label()
	


func update_score_label():
	$ScoreLabel.text = "SCORE = " + str(score)
	
	
func update_save_data():
	var save_data = SaveLoad.load_data_from_file()
	if score > save_data.highscore:
		save_data.highscore = score
		SaveLoad.save_data_to_file(save_data)


func _on_Ship_player_death():
	update_save_data()
	yield(get_tree().create_timer(2), "timeout")
	get_tree().change_scene("res://GameOverScreen.tscn")
