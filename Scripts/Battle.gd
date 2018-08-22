extends Node



func _process(delta):
	# Allow us as the playtester to quit the game
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	