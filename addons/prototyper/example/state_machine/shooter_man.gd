extends KinematicBody2D
class_name ShooterEnemy


export var move_spd = 400 # move spd in pixels/second
var move_dir
var target: Area2D
export var mag_size = 12
export var weapon_cooldown = 0.1

onready var state_machine: StateMachine = get_node("StateMachine")
onready var bullet_container: Node = get_node("BulletContainer")
onready var bullet: PackedScene = preload("res://addons/prototyper/example/state_machine/bullet.tscn")
onready var weapon_timer: Timer = get_node("WeaponCooldown")


func _ready():
	weapon_timer.wait_time = weapon_cooldown
	target = get_parent().get_node("CursorFollower")

func _physics_process(delta):
	# update states
	state_machine.process_states(delta)

	# update label
	$Label.text = state_machine.selected_state.name


func shoot():
	pass
