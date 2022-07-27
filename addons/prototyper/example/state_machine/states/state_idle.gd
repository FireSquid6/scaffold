extends State


func _on_DetectionArea_body_entered(body:Node):
	# wait until there's a state to change to
	machine.change_state("Moving")
