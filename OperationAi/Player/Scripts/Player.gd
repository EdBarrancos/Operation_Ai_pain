extends KinematicBody2D


onready var playerSprite = $PlayerSprite
onready var playerMovement = $PlayerMovement
onready var playerCollisonShape = $PlayerCollisionShape

# Called when the node enters the scene tree for the first time.
func _ready():
	playerMovement.Init(self)

func _process(delta):
	if Input.is_action_just_pressed("TEST"):
		var newDir = playerMovement.GetRandomDirections()
		playerMovement.SetDirections(newDir[0], newDir[1], newDir[2], newDir[3])

func MovePlayer(velocity, up):
	move_and_slide(velocity, up)
