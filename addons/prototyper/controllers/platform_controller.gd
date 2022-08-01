extends KinematicBody2D
# an extention of kinematic body that implements some frequently used systems for platfoming games
# it's recommended that this class is extended from and used in tandem with a state machine
class_name PlatformController2D


var velocity: Vector2 = Vector2.ZERO  # velocity the controller moves by every physics process frame
var move_dir: Vector2 = Vector2.ZERO  # the direction the controller is moving in
var jumping = false  # whether the controller is jumping or not

var jump = false  # input for jumping
var move_left = false  # input for moving left
var move_right = false  # input for moving right

export(float) var accspd = 18000  # how fast (in pixels / second) the controller accerates left and right
export(float) var max_spd = 1200  # the maximum speed (in pixels / second) the controller can travel moving left and right
export(float) var gravity = 1200  # how fast (in pixels / second) the controller falls
export(float) var terminal_velocity = -1  # the maximum amount of speed the player can accelerate downwards. If -1, will be ignored

export(float) var jump_impulse = 3600  # the impulse applied as soon as the jump key is pressed
export(float) var jump_gravity = 600  # the gravity applied while the controller is jumping
export(float) var max_jump_time = 0.3  # the maximum amount of time the jump key can be held until jump is canceled

export(bool) var do_default_physics_process = false  # whether the physics_process 

var jump_timer = Timer.new()  # a timer used for jumping


func _ready():
	# initiates some timers
	add_child(jump_timer)
	jump_timer.one_shot = true
	jump_timer.wait_time = max_jump_time


# applies gravity to the player's velocity
func apply_gravity(delta):
	if !is_on_floor():
		if jumping:
			velocity.y += jump_gravity
		else:
			velocity.y += gravity
		
		velocity.y = clamp(velocity.y, -terminal_velocity, 99999999)
	


# processes horizontal movement based on the move_left and move_right inputs
func accelerate():
	var move = move_right - move_left
	
	# accelerate if moving
	if move != 0:
		# if above max_spd, decelerate
		if abs(velocity.x) > max_spd:
			velocity.x -= accspd * sign(velocity.x)
		else:
			# otherwise, accelerate and clamp to max spd
			velocity.x += accspd * move
			velocity.x = clamp(velocity.x, -max_spd, max_spd)
	# decelerate if not moving
	else:
		# check if velocity needs to snap to 0
		if abs(velocity.x) <= accspd:
			velocity.x = 0
		#otherwise just subtract deacceleration speed
		else:
			velocity.x -= accspd * sign(velocity.x)


# processes the controller jumping
func process_jump(delta):
	pass


# called when the jump timer times out
func _on_JumpTimer_timeout():
	pass
