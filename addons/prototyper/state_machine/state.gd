extends Node
class_name State


onready var machine = get_parent() # the parent state machine manager


# runs whenever this state is entered
func _enter(args := []) -> void:
	pass


# runs whenever this state is exited
func _exit(args := []) -> void:
	pass


# execute game logic here
func _game_logic() -> void:
	pass


# virtual method for running transition logic
# this in
func _transition_logic(existing_states: Array):
	pass


# a virtual method that can be overriden to add parameters to make sure a state can be moved into first
# the method is run by the state_machine during the change_state method. If it returns false, the state change is aborted
# by default it always returns true
func _can_change() -> bool:
	return true


# same as _input(), but only called when active
func _active_input(event: InputEvent) -> void:
	pass