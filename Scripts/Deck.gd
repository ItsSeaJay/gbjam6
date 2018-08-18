extends Node2D

var cards = []
var card = load("res://Scenes/Card.tscn")

onready var label = get_node("../Control/DeckCount")

func _ready():
	for i in range(0, 20):
		var instance = card.instance()
		instance.title = "Card " + str(i)
		
		add_child(instance)
		cards.push_back(instance)
	
	cards = self.shuffle(cards)

func _process(delta):
	label.text = str(cards.size())

# Example taken from https://godotengine.org/qa/2547/how-to-randomize-a-list-array
func shuffle(list):
	var shuffled_list = []
	var indexes = range(list.size())
	
	# Re-seed the random number generator
	randomize()
	
	for i in range(list.size()):
		# Obtain a random index from the first list
		var position = randi() % indexes.size()
		
		# Add that card to the shuffled list
		shuffled_list.push_back(list[position])
		# Remove that card and its index from the old lists
		indexes.remove(position)
		list.remove(position)
	
	return shuffled_list