extends Control


const save_location = "user://data.save"


func _ready():
	# create a new object and modify it
	var data = SaveData.new()
	data.lives = 9
	data.level = 10
	data.name = "Jonathan"
	data.position = Vector2(1205, -1237)
	
	# freeze the object
	ObjectFreezer.save_properties(save_location, data)
	
	# reload the object
	var new_data: SaveData = SaveData.new()
	ObjectFreezer.load_properties(save_location, new_data)
	
	# print data from the object
	print(new_data.name)
	print(new_data.position)
	print(new_data.other_data.kills)
