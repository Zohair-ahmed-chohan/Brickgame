extends CharacterBody2D

@export var speed: float = 500.0

func _ready() -> void:
	velocity = Vector2(300, -400).normalized() * speed

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		var collider = collision.get_collider()
		
		if collider.name == "main_paddel":
			var hit_offset = (global_position.x - collider.global_position.x) / 50.0
			velocity = Vector2(hit_offset * 400, -abs(velocity.y)).normalized() * speed
		
		else:
			velocity = velocity.bounce(collision.get_normal())
