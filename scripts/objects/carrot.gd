extends KinematicBody2D

var get_magnetic = false

var carrot_ref = null
var player_reference = null



var velocity: Vector2

export(int) var speed

export(PackedScene) var desapear

func _physics_process(_delta):
	
	if player_reference != null and player_reference.name == "Bunny":
		var dir: Vector2 = (player_reference.global_position - global_position)
		if dir.length() < 5:
			velocity = Vector2.ZERO
		else:
			velocity = dir.normalized() * speed

	else:
		velocity = Vector2.ZERO

	velocity = move_and_slide(velocity)

	if carrot_ref != null and carrot_ref.name == "Bunny":
			Globals.enemies_count += 10
			spawn_effect(desapear)
			queue_free()

				

func spawn_effect(target_effect):
	var effect = target_effect.instance()
	effect.global_position = global_position
	get_tree().root.call_deferred("add_child", effect)

func on_body_entered(body):
	player_reference = body


func on_body_exited(_body):
	player_reference = null


func on_ColectArea_body_entered(body):
	carrot_ref = body



func on_ColectArea_body_exited(_body):
	carrot_ref = null

