extends Node2D

export var MAX_SIZE = 4

var cards = []
var card = load("res://Scenes/Card.tscn")

onready var deck = get_node("../Deck")
onready var cursor = get_node("../../Cursor")

signal witch

func _ready():
	self.connect("witch", self, "_test")
	self.emit_signal("witch")
	
	cursor.connect("wizard", self, "_test")

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		if len(cards) < MAX_SIZE:
			# Add a card to the hand from the deck
			self.draw_card()

# Draws a card from the deck
func draw_card():
	var instance = deck.cards[deck.cards.size() - 1]
	
	# Move the top card of the deck into the hand
	cards.push_back(instance)
	deck.remove_child(instance)
	add_child(instance)
	
	# Cards in the hand are treated as a unique "zone" that can be selected
	# by the cursor
	instance.add_to_group("Zone")
	
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
	
	deck.cards.pop_back()
	
	return instance

func _test():
	print("If you're reading this, then you're a witch.")