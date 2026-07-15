extends Node2D

@onready var hurtbox: Hurtbox = $Hurtbox
@export var stats: Stats:
	set(value):
		stats = value
		if stats is not Stats: return
		stats = stats.duplicate()

func _ready() -> void:
	hurtbox.hurt.connect(func(other_hitbox: Hitbox):
		stats.health -= other_hitbox.damage
		)
	stats.no_health.connect(func(): queue_free())
	pass

func _process(delta: float) -> void:
	pass
