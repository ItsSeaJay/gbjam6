extends Node2D

# Keep a list of all of the things we can hover over
var zones = []
var selection = {
	x = 0,
	y = 0
}

func _ready():
	zones = self.get_zones()

func _process(delta):
	global_position = zones[selection.x].global_position
	
	print(selection.x)
	
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

func get_zones():
	var zones = get_tree().get_nodes_in_group("Zone")
	
	return zones