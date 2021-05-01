extends KinematicBody2D

onready var playerSprite = $PlayerSprite
onready var playerMovement = $PlayerMovement
onready var playerCollisonShape = $PlayerCollisionShape
onready var playerSoupInventory = $SoupInventory

#DEBUGS
export var DMOVEMENT = false
export var DINVETORY = false

# Called when the node enters the scene tree for the first time.
func _ready():
	playerMovement.Init(self, DMOVEMENT)
	playerSoupInventory.Init(self, DINVETORY)

func _process(delta):
	if Input.is_action_just_pressed("TEST"):
		playerMovement.SetDirections(playerMovement.GetRandomDirections())

func MovePlayer(velocity, up):
	move_and_slide(velocity, up)
