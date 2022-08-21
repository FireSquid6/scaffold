extends Object
class_name ObjectFreezer

# encodes the properties of any object to be loaded later
# does not encode properties types or the object type
# does not encode sub-objects, only primitive types can be stored

const dont_store = ["script", "Script Variables"]  # list property names not to store


# note to future self: this needs to include some way to store the class name of the object.
# may require a full rewrite.

# converts the object's properties into a dictionary and then saves them to a text file. These can later be loaded onto an object from the same class using load_properties()
static func save_properties(filepath: String, obj: Object) -> void:
	# open the file
	var file = File.new()
	file.open(filepath, File.WRITE)
	
	# store all the properties in a dictionary
	var dict := object_to_dictionary(obj)
	
	# convert and store to josn
	var json = JSON.print(dict)
	file.store_pascal_string(json)
	
	# close the file
	file.close()


# converts an object to a dictionary
# the object must already be created
static func object_to_dictionary(obj: Object) -> Dictionary:
	var dict := {}
	
	# iterate through each property in the object's property list
	for property in obj.get_property_list():
		var key = property["name"]
		if !(key in dont_store):
			# get the value of the key
			var value = obj.get(key)
			
			# check if the value is another object
			if value as Object:
				# call this function again
				dict[key] = object_to_dictionary(value)
			else:
				# if it's a normal property
				dict[key] = value
	
	# return the final dictionary
	return dict


# loads the object's properties saved using save_properties onto a new object. This object must be from the same class as the saved object originally was, or it will not work.
static func load_properties(filepath: String, obj: Object) -> void:
	# open the file
	var file: File = File.new()
	file.open(filepath, File.READ)
	
	# iterate through the dictionary
	var dict: Dictionary = JSON.parse(file.get_pascal_string()).result4
	for key in dict.keys():
		obj.set(key, dict[key])
	
	# close the file
	file.close()


# converts a dictionary back to the original object. The base object must be created beforehand and passed as an argument
# the object must already be created
static func dictionary_to_object(dict: Dictionary, base_object: Object) -> void:
	for key in dict.keys():
		var value = dict[key]
		
		# check if the value is another object
		if value as Object:
			pass
		# otherwise, just load it as normal
		else:
			base_object.set(key, dict[key])
