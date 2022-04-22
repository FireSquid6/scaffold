extends Node
class_name State


onready var machine = get_parent() # the parent state machine manager

var jump = false
var jump_pressed = false
var move = 0
var dash = false


# runs whenever this state is entered
func _enter(_args := []) -> void:
	pass


# runs whenever this state is exited
func _exit(_args := []) -> void:
	pass


# runs whenever this state is updated
func _update() -> void:
	pass


# can be called by other states to check if this state can be moved into
func _can_change() -> bool:
	return true


# a virtual method for getting inputs. This function is called by the state machine before the update function
func _get_inputs() -> void:
	pass
