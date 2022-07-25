tool
extends KinematicBody2D
class_name PlatformController2D
# PlatformerController2D allows for easy creation of platform characters. It isn't very powerful on it's own, however with a StateMachine node combined with PlatformState nodes it can be.

# paths
export(NodePath) var state_machine_path = ""  # a path to the platform controller's state machine. This is required for it to work.
export(bool) var update_state_in_physics = true  # controls when the state_machine is updated. If true, the state_machine will be updated in the _physics_process() method, and will update in the _process() method otherwise.game

# variables
var velocity = Vector2(0, 0)  # the platorm controller's velocity. Changing this directly should be fine

# references
var state_machine = null


func _ready():
	# if an error occurs on the line below, you most likely misconfigured or forgot the state_machine_path variable
	state_machine = get_node(state_machine_path)


func _get_configuration_warning():
	if state_machine_path == "":
		return "PlatformerController2D requires a state_machine node to function properly."
	
	return ""
