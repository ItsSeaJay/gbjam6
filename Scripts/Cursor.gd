extends Node2D

# Keep a list of all of the things we can hover over
var zones = []

# Default to having the cursor on the deck
onready var selection = get_node("../Player/Deck")

func _ready():
	zones = get_tree().get_nodes_in_group("Zone")
	print(zones.size())

func _process(delta):
	global_position = selection.global_position