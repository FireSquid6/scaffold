extends Node
class_name StateMachine


var state_history = []
var possible_states = []
var selected_state: State
export(NodePath) var starting_state = ""
export(bool) var output_changes = false
export var max_state_history_length = 20

signal state_changed(old_state, new_state)


func _ready():
	# start initial state
	change_state(starting_state, [])

	# get all possible states
	for child in get_children():
		possible_states.append(child.get_name())



func change_state(new_state, args) -> bool:
	var old_name = "none"
	var new_name = "none"

	# have the old state exit
	if selected_state != null and (new_state in possible_states):
		# run exit function
		selected_state.exit(args)
		
		# edit state history
		state_history.insert(0, selected_state.name)
		if len(state_history) > max_state_history_length:
			state_history.remove(20)

		# debug stuff
		old_name = selected_state.name
	else:
		if output_changes:
			print("State change failed")
		return false
	
	# enter into the new state
	selected_state = get_node(new_state)
	selected_state.enter()
	new_name = selected_state.name

	# output debug
	if output_changes:
		print("Switched from " + old_name + " to " + new_name)
	
	# emit signal
	emit_signal("state_changed", old_name, new_name)

	# return success
	return true


# tells the state machine to process all of the states
func process_states():
	selected_state.get_inputs()
	selected_state.update()


func _get_configuration_warning():
	if starting_state == "":
		return "StateMachine requires a starting state to be set to work properly"
	
	return ""


func state_logic():
	pass