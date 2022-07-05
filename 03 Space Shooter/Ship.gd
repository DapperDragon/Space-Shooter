extends Area2D

const BULLET = preload("res://Bullet.tscn")
const EXPLOSION_EFFECT = preload("res://ExplosionEffect.tscn")

export(int) var SPEED = 200

onready var main = get_tree().current_scene

signal player_death

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
		
	if Input.is_action_just_released("ui_accept"):
		fire_bullet()
	pass
	
func fire_bullet():
	var bullet = BULLET.instance()
	main.add_child(bullet)
	bullet.global_position = global_position


func _on_Ship_area_entered(area):
	queue_free()
	area.queue_free()
	
func _exit_tree():
	var main = get_tree().current_scene
	var explosionEffect = EXPLOSION_EFFECT.instance()
	main.add_child(explosionEffect)
	explosionEffect.global_position = global_position
	emit_signal("player_death")
