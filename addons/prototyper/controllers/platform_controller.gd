tool
extends KinematicBody2D
class_name PlatformController2D

# PlatformerController2D allows for easy creation of platform characters. It extends from KinematicBody2D
# Features:
	# Cyote time
	# variable jump vs normal gravity
	# Input buffering


export(NodePath) var state_machine = "" # a reference to the platform controller's state machine. This is required for the platform controller to work


func _get_configuration_warning():
	if state_machine == "":
		return "PlatformerController2D requires a state_machine node to function properly."
	
	return ""