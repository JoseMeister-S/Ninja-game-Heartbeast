extends CharacterBody2D

@onready var animation_player_lower: AnimationPlayer = $AnimationPlayerLower

@onready var animation_player_upper: AnimationPlayer = $AnimationPlayerUpper

@onready var anchor: Node2D = $Anchor


func _physics_process(delta: float) -> void:
	var x_input =Input.get_axis("ui_right", "ui_left")
	
	velocity.x-= x_input * 5
	if not is_on_floor():
		velocity.y += 200 * delta
		
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -200
	
	if x_input !=0:
		anchor.scale.x = - sign(x_input)	
		animation_player_lower.play("run")
		animation_player_upper.play("run")
		
	else:
		animation_player_lower.play("stand")
		animation_player_upper.play("stand")
		
	if not is_on_floor():
		animation_player_lower.play("jump")
		animation_player_upper.play("jump")
	move_and_slide()
