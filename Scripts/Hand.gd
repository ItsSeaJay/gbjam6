extends Node2D

export var MAX_SIZE = 6

var card = load("res://Scenes/Card.tscn")
var cards = []

onready var deck = get_node("../Deck")

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		if len(cards) < MAX_SIZE:
			self.draw()

# Draws a card from the deck
func draw():
	# TODO: obtain the card instance from the actual deck
	#       instead of creating new ones
	var instance = card.instance()
	var sprite = instance.get_node("Sprite")
	
	cards.push_back(instance)
	add_child(instance)
	
	for c in cards:
		c.global_position.x = global_position.x
		c.global_position.y = global_position.y