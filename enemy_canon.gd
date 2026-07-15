extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D

@onready var hurtbox: Hurtbox = $Hurtbox
@onready var effects_animation_player: AnimationPlayer = $EffectsAnimationPlayer

@onready var shaker: = Shaker.new(sprite_2d)

@export var stats: Stats:
	set(value):
		stats = value
		if stats is not Stats: return
		stats = stats.duplicate()

func _ready() -> void:
	hurtbox.hurt.connect(func(other_hitbox: Hitbox):
		stats.health -= other_hitbox.damage
		effects_animation_player.play("hit_flash")
		shaker.shake(2, 0.2)

		)
	stats.no_health.connect(func(): queue_free())
	pass

func _process(delta: float) -> void:
	pass
