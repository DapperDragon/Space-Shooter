extends RigidBody2D

const HIT_EFFECT = preload("res://HitEffect.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _exit_tree():
	create_hit_effect()

func create_hit_effect():
	var main = get_tree().current_scene
	var hitEffect = HIT_EFFECT.instance()
	main.add_child(hitEffect)
	hitEffect.global_position = global_position

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
