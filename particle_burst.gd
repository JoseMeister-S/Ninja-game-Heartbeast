class_name ParticleBurst extends GPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	finished.connect(queue_free)
	emitting = true
	explosiveness =1.0
	one_shot = true
	local_coords = true
	restart()
