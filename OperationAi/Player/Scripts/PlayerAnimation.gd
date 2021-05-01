extends Node2D


var player
var playerMovement
var playerSprite
var stopAnimation = false

onready var animationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func Init(owner):
	player = owner
	playerMovement = player.playerMovement
	playerSprite = player.playerSprite

func _process(delta):
	if playerMovement.GetVelocityLength() > 1:
		PlayWalkingAnimation()
	else:
		StopAnimation()
		
	if playerMovement.velocity.x > 0: turn_right()
	elif playerMovement.velocity.x < 0: turn_left()
		
		
func is_sprite_flipped(): return playerSprite.flip_h

func flip_sprite(): playerSprite.flip_h = not playerSprite.flip_h

func turn_right():
	if is_sprite_flipped(): flip_sprite()

func turn_left():
	if not is_sprite_flipped(): flip_sprite()
		
func PlayWalkingAnimation():
	animationPlayer.play("Walking")
	
func StopAnimation():
	animationPlayer.stop()
