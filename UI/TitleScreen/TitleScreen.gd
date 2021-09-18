extends Control

func _ready():
	print("Global.current_score: ", Global.current_score, " Global.high_score: ", Global.high_score)
	if (Global.current_score > Global.high_score):
		print("Global.current_score: ", Global.current_score, " Global.high_score: ", Global.high_score)
		Global.high_score = Global.current_score
	Global.current_score = 0
	$HighScore.text = "high score: " + str(Global.high_score)

func _process(_delta):
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene("res://Level/Level.tscn")
