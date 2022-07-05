extends Area2D

const EXPLOSION_EFFECT = preload("res://ExplosionEffect.tscn")

export(int) var SPEED = 40
export(int) var HEALTH = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= SPEED * delta


func _on_Enemy_body_entered(body):
	body.queue_free()
	HEALTH -= 1
	if HEALTH <= 0:
		var main = get_tree().current_scene
		if main.is_in_group("World"):
			main.score += 10
		create_explosion()
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func create_explosion():
	var main = get_tree().current_scene
	var explosionEffect = EXPLOSION_EFFECT.instance()
	main.add_child(explosionEffect)
	explosionEffect.global_position = global_position
