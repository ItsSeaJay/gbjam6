extends Node2D

var card = load("res://Scenes/Card.tscn")

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		self.draw()

func draw():
	var instance = card.instance()
	add_child(instance)