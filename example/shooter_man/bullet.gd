extends KinematicBody2D
class_name Bullet


var direction = Vector2.UP
export var spd = 800


func _physics_process(delta):
	var _collision = move_and_collide(direction * spd * delta)
