extends Node2D


const ENEMY = preload("res://Enemy.tscn")

onready var spawnPoints = $SpawnPoints




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_spawn_point():
	var points = spawnPoints.get_children()
	points.shuffle()
	return points[0].global_position
	
func spawn_enemy():
	var spawn_point = get_spawn_point()
	var enemy = ENEMY.instance()
	var main = get_tree().current_scene
	main.add_child(enemy)
	enemy.global_position = spawn_point
	
func _on_Timer_timeout():
	spawn_enemy()
