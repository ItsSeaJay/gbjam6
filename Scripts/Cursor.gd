extends Node2D

# Keep a list of all of the things we can hover over
var zones = []
var selection = {
	x = 0,
	y = 0
}

onready var hand = get_node("../Player/Hand")

signal wizard

func _ready():
	zones = self.get_zones()

	self.emit_signal("wizard")

func _process(delta):
	global_position = zones[selection.x].global_position
	
	if Input.is_action_just_pressed("ui_right"):
		if selection.x >= zones.size() - 1:
			selection.x = 0
		else:
			selection.x = selection.x + 1
	
	if Input.is_action_just_pressed("ui_left"):
		if selection.x <= 0:
			selection.x = zones.size() - 1
		else:
			selection.x = selection.x - 1

func _test():
	print("If you're reading this, then you're a wizard.")

func get_zones():
	var z = get_tree().get_nodes_in_group("Zone")
	
	return z