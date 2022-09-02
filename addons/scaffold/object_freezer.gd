extends Object
class_name ObjectFreezer

# encodes the properties of any object to be loaded later
# does not encode properties or the object type
# does not encode sub-objects

const dont_store = ["script", "Script Variables"]

# converts the object's properties into a dictionary and then saves them to a text file. These can later be loaded onto an object from the same class using load_properties()
static func save_properties(filepath: String, obj: Object) -> void:
	# open the file
	var file = File.new()
	file.open(filepath, File.WRITE)
	
	# store all the properties in a dictionary
	var dict := {}
	
	for property in obj.get_property_list():
		var key = property["name"]
		if !(key in dont_store):
			var value = obj.get(key)
			dict[key] = value
	
	# convert and store to josn
	var json = JSON.print(dict)
	file.store_pascal_string(json)
	
	# close the file
	file.close()


# loads the object's properties saved using save_properties onto a new object. This object must be from the same class as the saved object originally was, or it will not work.
static func load_properties(filepath: String, obj: Object) -> void:
	# open the file
	var file: File = File.new()
	file.open(filepath, File.READ)
	
	# iterate through the dictionary
	var dict: Dictionary = JSON.parse(file.get_pascal_string()).result
	for key in dict.keys():
		obj.set(key, dict[key])
	
	# close the file
	file.close()
