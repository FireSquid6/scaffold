extends Object
class_name ObjectSaver

# encodes the properties of any object to be loaded later
# does not encode properties or the object type
# does not encode sub-objects

# converts the object's properties into a dictionary and then saves them to a text file
static func save_object(filepath: String, obj: Object) -> void:
	var file = File.new()
	
	# store each property as a json string
	# some sort of match statement followed by getting the property's value will be neccessary here
	# also check out the to_json() function? not sure if it'll help for Vector2's and such
	file.open(filepath, File.WRITE)
	var dict = {}
	for property in obj.get_property_list():
		var json = property.to_json()
		file.store_pascal_string(json)
	file.close()


# loads the object
static func load_object(filepath: String, obj: Object) -> Object:
	var file: File = File.new()
	file.open(filepath, File.READ)
	
	# iterate through the file
	while file.get_position() < file.get_len():
		var json = file.get_pascal_string()
		var property = JSON.parse(json).result
		
		obj.set(property["name"], property["value"])
		
	return null
