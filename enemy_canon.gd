extends Node2D

const SPARK_PARTICLE_BURST_EFFECT =preload ("res://sparks_particle_burst_effect.tscn")
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
		var spark_particle = SPARK_PARTICLE_BURST_EFFECT.instantiate()
		get_tree().current_scene.add_child(spark_particle)
		spark_particle.global_position = (sprite_2d.global_position + Vector2(0, -7))
		stats.health -= other_hitbox.damage
		effects_animation_player.play("hit_flash")
		shaker.shake(2, 0.2)

		)
	stats.no_health.connect(func(): queue_free())
	pass
