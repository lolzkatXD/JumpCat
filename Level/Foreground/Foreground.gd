extends Node

const sprite_list = ["grass1", "grass2", "leaf1", "leaf2", "leaf3", "leaf4"]

onready var speed =  rand_range(300, 500)

func _ready():
	var current_sprite = sprite_list[randi() % sprite_list.size()]
	$Sprite.animation = current_sprite
	$Sprite.playing = true
	
	$Sprite.offset.x = 1500
	$Sprite.offset.y = rand_range(350, 610)

func _process(delta):
	$Sprite.offset.x -= speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
