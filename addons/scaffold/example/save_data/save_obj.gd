extends Object
class_name SaveData


var level = 0
var score = 0
var lives = 4
var name = ""
var position = Vector2(0, 0)
var other_data: OtherData = OtherData.new()


func _init():
	other_data.kills = 15
	other_data.deaths = 1238  # this is PokeyC's actual k/d ratio


func foo():
	print("I did the thing!")
