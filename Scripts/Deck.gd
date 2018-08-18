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
	
	self.shuffle()

func _process(delta):
	label.text = str(cards.size())

func shuffle():
	pass