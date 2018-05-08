extends Node

var dump = {}

func _ready():
	dump["level"] = "Fire Level 0"
	dump["state"] = {"inventory": []}
	print(to_json(dump))