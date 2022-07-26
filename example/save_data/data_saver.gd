extends Control


const save_location = "user://data.save"


func _ready():
	# feel free to throw a breakpoint here!
	# run data_saver.tscn to run this script
	
	# create a new instance of save data and then modify it
	var data = SaveData.new()
	data.lives = 9
	data.level = 10
	data.name = "Jonathan"
	data.position = Vector2(1205, -1237)
	
	# freeze the properties of save data
	ObjectFreezer.freeze_object(save_location, data)
	
	# create a new save data object
	var new_data: SaveData = SaveData.new()
	
	# load the properties of the frozen object onto the new one
	ObjectFreezer.microwave_object(save_location, new_data)
	
	# print the properties of the new object
	print(new_data.name)
	print(new_data.position)
