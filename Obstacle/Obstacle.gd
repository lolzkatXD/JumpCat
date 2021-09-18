extends Area2D

const obstacle_list = ["sloth", "couch", "family", "maru", "pile", "pizza"]

onready var speed =  rand_range(300, 500)

func _ready():
	position.x = 1500
	position.y = 300
	randomize()
	var current_obstacle = obstacle_list[randi() % obstacle_list.size()]
	$AnimatedSprite.animation = current_obstacle
	$AnimatedSprite.playing = true

func _physics_process(delta):
	position.x -= speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Obstacle_body_entered(_body):
	get_tree().call_group("Player", "end_game")
