<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ObjectSaver

**Extends:** [Object](../Object)

## Description
encodes the properties of any object to be loaded later
does not encode properties or the object type
does not encode sub-objects

## Constants Descriptions

### dont\_store

```gdscript
const dont_store: Array = ["script","Script Variables"]
```
a list of variable names the freezer should not store.


## Method Descriptions

### save\_properties <small>(static)</small>

```gdscript
func save_properties(filepath: String, obj: Object) -> void
```

converts the object's properties into a dictionary and then saves them to a text file. These can later be loaded onto an object from the same class using load_properties()

### load\_properties <small>(static)</small>

```gdscript
func load_properties(filepath: String, obj: Object) -> void
```

loads the object's properties saved using save_properties onto a new object. This object must be from the same class as the saved object originally was, or it will not work.