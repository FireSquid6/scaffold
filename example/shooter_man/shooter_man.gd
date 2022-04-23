extends KinematicBody2D


export var move_spd = 400 # move spd in pixels/second
var move_dir


func _physics_process(delta):
	move_dir = Vector2(int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")), int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up")))