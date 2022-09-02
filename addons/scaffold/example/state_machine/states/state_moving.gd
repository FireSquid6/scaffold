extends State


var move_point = Vector2.ZERO
var velocity = Vector2.ZERO
export var move_spd = 100
export var max_move_dist = 256
export var min_move_dist= 128

func _enter(_args := []):
	# get random direction
	var dir = Vector2.UP
	dir = dir.rotated(rand_range(0, deg2rad(359)))

	# get random position
	move_point = machine.parent.position + (dir * rand_range(min_move_dist, max_move_dist))

	# get velocity
	velocity = dir * move_spd
	

func _game_logic(delta) -> void:
	# move towards the designated mvoe point
	if machine.parent.position.distance_to(move_point) <= (velocity * delta).length():
		# snap if neccessary
		machine.parent.position = move_point
		machine.change_state("Shooting")
	else:
		machine.parent.move_and_slide(velocity)
