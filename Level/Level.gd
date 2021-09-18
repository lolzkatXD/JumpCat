extends Node

const OBSTACLE = preload("res://Obstacle/Obstacle.tscn")
const BACKGROUND = preload("res://Level/Background/Background.tscn")
const FOREGROUND = preload("res://Level/Foreground/Foreground.tscn")

func _ready():
	pass

func _on_Timer_timeout():
	var obstacle = OBSTACLE.instance()
	add_child_below_node($Horizon, obstacle)

func _on_ScoreTimer_timeout():
	Global.current_score += 1
	
	var background_object = BACKGROUND.instance()
	add_child_below_node($Horizon, background_object)
	
	var foreground_object = FOREGROUND.instance()
	add_child(foreground_object)
	
	$Timer.wait_time = rand_range(1, 10)

func _process(_delta):
	$"Score".text = "score: " + str(Global.current_score)
