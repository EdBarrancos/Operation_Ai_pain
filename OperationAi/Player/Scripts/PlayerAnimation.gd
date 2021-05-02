extends Node2D


var player
var playerMovement
var playerSprite
var stopAnimation = false

var walking = false
var startWalking = false
var continueWalking = false

onready var animationPlayer = $AnimationPlayer
onready var footsteps = $FootSteps


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
	walking = true
	UpdateWalking()
	animationPlayer.play("Walking")
	PlayFootstepSound()
	
func StopAnimation():
	walking = false
	UpdateWalking()
	animationPlayer.stop()
	StopFootstepSound()
	
func PlayFootstepSound():
	if startWalking:
		footsteps.play()
		
func StopFootstepSound():
	footsteps.stop()
	
	
func UpdateWalking():
	if walking:
		startWalking = false
	if not walking:
		continueWalking = false
	if walking and not startWalking and not continueWalking:
		#Just Started
		startWalking = true
		continueWalking = true

