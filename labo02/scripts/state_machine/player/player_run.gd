class_name PlayerRun
extends PlayerBaseState

func enter():
	player.animated_sprite.play("run")

func handle_inputs(input_event: InputEvent) -> void :
	if check_jump():
		return

func physics_update(delta: float) -> void:
	apply_horizontal_movement()
	
	if check_fall():
		return
		
	var dir := get_movement_direction()
	if dir == 0.0:
		Transitioned.emit(self, "idle")
