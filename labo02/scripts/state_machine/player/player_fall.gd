class_name PlayerFall
extends PlayerBaseState

func enter():
	player.animated_sprite.play("fall")

func physics_update(delta: float) -> void:
	apply_horizontal_movement()
	
	if player.is_on_floor():
		var dir := get_movement_direction()
		if dir != 0.0:
			Transitioned.emit(self, "run")
		else:
			Transitioned.emit(self, "idle")
		return
