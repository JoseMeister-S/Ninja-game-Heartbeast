extends CharacterBody2D

@onready var animation_player_lower: AnimationPlayer = $AnimationPlayerLower

@onready var animation_player_upper: AnimationPlayer = $AnimationPlayerUpper


func _physics_process(delta: float) -> void:
	var x_input =Input.get_axis("ui_right", "ui_left")
	velocity.x-= x_input * 5
	if x_input !=0:
		animation_player_lower.play("run")
		animation_player_upper.play("run")
	else:
		animation_player_lower.play("stand")
		animation_player_upper.play("stand")
	move_and_slide()
