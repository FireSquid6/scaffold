tool
extends Node2D
class_name Circle2D


export(float) var radius = 10.0
export(Color) var color = Color(1, 1, 1, 1)
var canvas_item: CanvasItem = CanvasItem.new()


func _process(delta):
	property_list_changed_notify()

func _draw():
	draw_circle(position, radius, color)