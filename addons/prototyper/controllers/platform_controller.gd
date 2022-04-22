tool
extends KinematicBody2D
class_name PlatformController2D


export(NodePath) var state_machine = "" # a reference to the platform controller's state machine. This is required for the platform controller to work


func _get_configuration_warning():
	if state_machine == "":
		return "PlatformerController2D requires a state_machine node to function properly."
	
	return ""