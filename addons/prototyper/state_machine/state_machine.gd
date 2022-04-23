extends Node

# a node that controls a group of state nodes. Useful for tons of different systems
class_name StateMachine


var state_history = [] # the past x amount of states
var possible_states = [] # a list of all the possible states (in string form)
var selected_state: State # a refernce to whatever state is currently active
export(NodePath) var starting_state = "" # a path to the starting state
export(bool) var output_changes = false # whether state changes should be outputted to the debug console
export var max_state_history_length = 20 # the maximum length the state_history can be

signal state_changed(old_state, new_state) # emitted whenever a state is changed
signal game_logic_finished() # emitted whenever the state finishes running its game_logic function
signal transfer_logic_finished() # emitted whenever state finishes running its transfer logic


func _ready():
	# start initial state
	change_state(starting_state)

	# get all possible states
	for child in get_children():
		possible_states.append(child.get_name())


# changes the state to new_state. The enter_args array will be passed into the new state's _enter() function, while the exit_args array will be passed into the old state's _exit() function
# This function returns a boolean indicating if the state change was successful
# note: state history is updated before the new state's enter function is called but after the current state's exit function is called.
func change_state(new_state: String, enter_args := [], exit_args := []) -> bool:
	var old_name = "none"
	var new_name = "none"

	# have the old state exit
	if selected_state != null and (new_state in possible_states):
		# run exit function
		selected_state._exit(exit_args)
		
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
	selected_state = get_state(selected_state)
	selected_state._enter(enter_args)
	new_name = selected_state.name

	# output debug
	if output_changes:
		print("Switched from " + old_name + " to " + new_name)
	
	# emit signal
	emit_signal("state_changed", old_name, new_name)

	# return success
	return true


# tells the state machine to process all of the states
# runs the state's game_logic and then runs its transfer_logic
func process_states():
	selected_state._game_logic()
	emit_signal("game_logic_finished")
	selected_state._transfer_logic(possible_states)
	emit_signal("transfer_logic_finished")


func _get_configuration_warning():
	if starting_state == "":
		return "StateMachine requires a starting state to be set to work properly"
	
	return ""


# gets a reference to a state
func get_state(state_name):
	return get_node(state_name)


func _input(event):
	selected_state._active_input(event)