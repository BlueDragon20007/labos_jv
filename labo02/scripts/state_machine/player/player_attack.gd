class_name PlayerAttack
extends PlayerBaseState

func enter():
	player.animated_sprite.play("attack")
	
	await player.animated_sprite.animation_finished
	
	Transitioned.emit(self, "idle")

func handle_inputs(input_event: InputEvent) -> void :
	if check_jump():
		return

func physics_update(delta: float) -> void:
	player.velocity.x = lerp(player.velocity.x, 0.0, 0.2)
	
	if check_fall():
		return
		
	var dir := get_movement_direction()
	if dir != 0.0:
		Transitioned.emit(self, "run")
