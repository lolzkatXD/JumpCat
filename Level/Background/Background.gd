extends Node

const sprite_list = ["broom", "balloon", "balloons"]

onready var speed =  rand_range(300, 500)

func _ready():
	randomize()
	var current_sprite = sprite_list[randi() % sprite_list.size()]
	$Sprite.animation = current_sprite
	$Sprite.playing = true
	
	$Sprite.offset.x = 3500
	$Sprite.offset.y = rand_range(0, 600)

func _process(delta):
	$Sprite.offset.x -= speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
