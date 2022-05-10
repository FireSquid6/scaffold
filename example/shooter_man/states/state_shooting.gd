extends State


var in_mag = 0


func _enter(_args: Array = []) -> void:
	in_mag = machine.parent.mag_size
	machine.parent.weapon_timer.start()


func _on_WeaponCooldown_timeout():
	# get objects
	var shooter: ShooterEnemy = machine.parent
	var bullet: Bullet = shooter.bullet.instance()

	# set the bullet's direction and position
	var other_pos = shooter.target.position
	var dir = (other_pos - shooter.position).normalized()
	bullet.direction = dir
	bullet.position = shooter.position

	# add the bullet to the scene
	shooter.bullet_container.add_child(bullet)

	# remove the bullet from the mag
	in_mag -= 1

	if in_mag > 0:
		# reset the timer
		shooter.weapon_timer.start()


func _transition_logic(_existing_states: Array):
	if in_mag <= 0:
		machine.change_state("Moving")

func _on_DetectionArea_body_exited(_body:Node):
	machine.change_state("Idle")
