@abstract class_name PlayerBaseState
extends BaseState

var player: Player

const SPEED = 150.0

func _ready() -> void:
	player = get_parent().get_parent() as Player

func _input(event: InputEvent) -> void:
	handle_inputs(event)

func handle_inputs(_input_event: InputEvent) -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func enter() -> void:
	pass

func exit() -> void:
	pass

func get_movement_direction() -> float:
	return Input.get_axis("move_left", "move_right")

func apply_horizontal_movement():
	var dir := get_movement_direction()
	
	if dir:
		player.velocity.x = dir * player.SPEED
		player.animated_sprite.flip_h = dir < 0.0
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)

func check_fall() -> bool:
	if not player.is_on_floor() and player.velocity.y > 0:
		Transitioned.emit(self, "fall")
		return true
	return false

func check_jump() -> bool:
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		Transitioned.emit(self, "jump")
		return true
	return false

func check_attack() -> bool:
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "attack")
		return true
	return false
