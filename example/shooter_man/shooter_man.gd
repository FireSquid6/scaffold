extends KinematicBody2D
class_name ShooterPlayer


export var move_spd = 400 # move spd in pixels/second
var move_dir
var target
export var mag_size = 12
export var weapon_cooldown = 0.1

onready var state_machine: StateMachine = get_node("StateMachine")
onready var bullet_container: Node = get_node("BulletContainer")
onready var bullet: PackedScene = preload("res://example/shooter_man/bullet.tscn")
onready var weapon_timer: Timer = Timer.instance()


func _ready():
	weapon_timer.wait_time = weapon_cooldown
	weapon_timer.one_shot = true

	add_child(weapon_timer)


func _physics_process(_delta):
	# update states
	state_machine.process_states()


func shoot():
	pass