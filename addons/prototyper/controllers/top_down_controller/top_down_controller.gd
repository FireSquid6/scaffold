extends KinematicBody2D
class_name TopDownController


var velocity: Vector2 = Vector2.ZERO  # velocity the controller moves by every physics process frame
var move_dir: Vector2 = Vector2.ZERO  # the direction the controller is moving in

export(String) var move_up = "ui_up"  # input for moving up
export(String) var move_down = "ui_down"  # input for moving down
export(String) var move_left = "ui_left"  # input for moving left
export(String) var move_right = "ui_right"  # input for moving right

export(float) var accspd = 18000  # how fast (in pixels / second) the controller accerates
export(float) var max_spd = 1200  # the maximum speed (in pixels / second) the controller can travel at from just using accelerate_and_move()

onready var state_machine: StateMachine = get_node("StateMachine")  # reference to the state machine


func _physics_process(delta):
	# run through the states
	state_machine.process_states()
	
	# move
	velocity = move_and_slide(velocity)

func accelerate_and_move(delta):
	# get the move dir
	move_dir = Vector2(int(Input.is_action_pressed(move_right)) - int(Input.is_action_pressed(move_left)), int(Input.is_action_pressed(move_down)) - int(Input.is_action_pressed(move_up))).normalized()
	
	# if inputs have been presssed
	if move_dir.length() > 0:
		# accelerate
		var vel_length = velocity.length()
		vel_length += (accspd * delta)
		
		# snap to max spd
		if vel_length > max_spd:
			vel_length = max_spd
		
		# set velocity
		velocity = move_dir * vel_length
	else:
		# decelerate
		if velocity.length() <= (accspd * delta):
			# snap to 0 length
			velocity = Vector2.ZERO
		else:
			# decelerate
			var angle = velocity.angle()
			var new_length = velocity.length() - (accspd * delta)
			
			# set velocity
			velocity = Vector2(new_length, 0).rotated(angle)
