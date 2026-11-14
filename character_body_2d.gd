extends CharacterBody2D

@export var speed = 1500.0

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")

	velocity.x = direction * speed
	velocity.y = 0

	move_and_slide()


func _on_reset_body_entered(body: Node2D) -> void:
	# Jab bhi koi body (ball) reset area ko touch karegi, game dobara restart ho jayega
	get_tree().reload_current_scene()
