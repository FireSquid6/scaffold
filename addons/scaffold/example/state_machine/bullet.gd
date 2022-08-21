extends KinematicBody2D
class_name Bullet


var direction = Vector2.UP
export var spd = 800


func _physics_process(_delta):
	rotation = direction.angle() + deg2rad(90)
	var _new_vel = move_and_slide(direction * spd)
