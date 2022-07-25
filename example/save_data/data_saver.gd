extends Control


const save_location = "user://data.save"


func _ready():
	var data = SaveData.new()
	data.lives = 9
	data.level = 10
	data.name = "Jonathan"
	
	ObjectSaver.save_object(save_location, data)
	
	var new_data = ObjectSaver.load_object(save_location, data)
