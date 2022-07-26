extends Node
class_name State


onready var machine = get_parent() # the parent state machine manager


# runs whenever this state is entered
func _enter(args := []) -> void:
	pass


# runs whenever this state is exited
func _exit(args := []) -> void:
	pass


# virtaul method for running game logic. Delta is whatever value is passed to the state machine when process_states() is called.
func _game_logic(delta) -> void:
	pass


# virtual method for running transition logic
func _transition_logic(existing_states: Array):
	pass


# a virtual method that can be overriden to add parameters to make sure a state can be moved into first. The method is run by the state_machine during the change_state method. If it returns false, the state change is aborted. By default it always returns true
func _can_change() -> bool:
	return true


# same as _input(), but only called when active
func _active_input(event: InputEvent) -> void:
	pass
