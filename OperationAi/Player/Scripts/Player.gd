extends KinematicBody2D

onready var playerSprite = $PlayerSprite
onready var playerMovement = $PlayerMovement
onready var playerCollisonShape = $PlayerCollisionShape
onready var playerSoupInventory = $SoupInventory
onready var playerCamera = $PlayerCamera2D

#DEBUGS
export var DMOVEMENT = false
export var DINVETORY = false
export var DCAMERA = false

#Camera Limits
export var upperLimit = 40
export var lowerLimit = 300
export var leftLimit = -275
export var rightLimit = 275


# Called when the node enters the scene tree for the first time.
func _ready():
	playerMovement.Init(self, DMOVEMENT)
	playerSoupInventory.Init(self, DINVETORY)
	playerCamera.Init(self, DCAMERA)
	playerCamera.SetLimits(upperLimit, lowerLimit, leftLimit, rightLimit)

func _process(delta):
	if Input.is_action_just_pressed("TEST"):
		playerMovement.SetDirections(playerMovement.GetRandomDirections())

func MovePlayer(velocity, up):
	move_and_slide(velocity, up)
