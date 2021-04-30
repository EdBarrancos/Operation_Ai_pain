extends KinematicBody2D


onready var playerSprite = $PlayerSprite
onready var playerMovement = $PlayerMovement
onready var playerCollisonShape = $PlayerCollisionShape

# Called when the node enters the scene tree for the first time.
func _ready():
	playerMovement.Init(self)


func MovePlayer(velocity, up):
	move_and_slide(velocity, up)
