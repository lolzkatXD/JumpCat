extends KinematicBody2D

const GRAVITY = 10
const JUMP_SPEED = -450

var velocity = Vector2.ZERO

func _ready():
	$AnimatedSprite.playing = true

func _physics_process(_delta):
	velocity.y += GRAVITY
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$jump_sound.play()
		velocity.y = JUMP_SPEED
	
	if is_on_floor():
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("jump")
	
	move_and_slide(velocity, Vector2.UP)

func end_game():
	get_tree().change_scene("res://UI/TitleScreen/TitleScreen.tscn")
