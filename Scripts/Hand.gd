extends Node2D

export var MAX_SIZE = 4

var card = load("res://Scenes/Card.tscn")
var cards = []

onready var deck = get_node("../Deck")

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		if len(cards) < MAX_SIZE:
			# Add a card to the hand from the deck
			self.draw()

# Draws a card from the deck
func draw():
	# TODO: obtain the card instance from the actual deck
	#       instead of creating new ones
	var instance = card.instance()
	
	cards.push_back(instance)
	add_child(instance)
	
	# Recalculate the positions of each card in the hand
	for i in range(cards.size()):
		var margin = 0
		var card_width = 18
		var origin = Vector2(global_position.x, global_position.y - margin)
		var total_width = (cards.size() * card_width)
		var offset = ((total_width / cards.size()) * i)
		var center = (total_width / 2) - (card_width / 2)
		
		cards[i].global_position.x = origin.x + offset - center
		cards[i].global_position.y = origin.y
		
		print("Global Position [", i, "]:", cards[i].global_position)