extends CharacterBody2D



func _physics_process(delta: float) -> void:
	var x_input =Input.get_axis("ui_right", "ui_left")
	velocity.x-= x_input * 5
	move_and_slide()
