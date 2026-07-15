class_name Hitbox extends Area2D

@export var damage = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(on_area_entered)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_area_entered(area_2d: Area2D) -> void:
	assert(area_2d is Hurtbox, "The hitbox detected an area that wasn't a hurtbox.")
	var hurtbox= area_2d as Hurtbox
	hurtbox.hurt.emit(self)
	pass
