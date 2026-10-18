class_name PlayerJump
extends PlayerBaseState

func enter():
	player.animated_sprite.play("jump")
	player.velocity.y = player.JUMP_VELOCITY

func physics_update(delta: float) -> void:
	apply_horizontal_movement()
	
	if check_fall():
		return
