extends State


var move_point = Vector2.ZERO
var velocity = Vector2.ZERO
export var move_spd = 100
export var max_move_dist = 256

func _enter(_args := []):
	var dir = Vector2.UP
	dir = dir.rotated(rand_range(0, deg2rad(359)))


func _game_logic() -> void:
	var delta = get_physics_process_delta_time()
	if machine.parent.position.distance_to(move_point) <= (velocity * delta).lenght():
		machine.parent.position = move_point
		machine.change_state("Shooting")
	else:
		machine.parent.move_and_slide(velocity * delta)
