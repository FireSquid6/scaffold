extends Control


const save_location = "user://data.save"


func _ready():
	var data = SaveData.new()
	data.lives = 9
	data.level = 10
	data.name = "Jonathan"
	data.position = Vector2(1205, -1237)
	
	ObjectFreezer.save_object(save_location, data)
	
	var new_data: SaveData = SaveData.new()
	ObjectFreezer.load_object(save_location, new_data)
	print(new_data.name)
	print(new_data.position)
