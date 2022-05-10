extends KinematicBody2D
class_name Bullet


var direction = Vector2.UP
export var spd = 800


func _ready():
	print("bullet created")

func _physics_process(delta):
	move_and_slide(direction * spd)
