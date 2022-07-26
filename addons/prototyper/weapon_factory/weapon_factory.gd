extends Node
class_name WeaponFactory


onready var container: Node = get_node("Container")
var weapon_nodes = []
var weapon_ids = []

var id_to_node := {}
var node_to_id := {}

func _ready():
	for child in container:
		if child as Weapon:
			weapon_nodes.append(child)
			weapon_ids.append(child.id)


func make_weapon(id):
	return id_to_node[id]
