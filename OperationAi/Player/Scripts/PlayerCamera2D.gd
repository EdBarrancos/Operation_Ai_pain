extends Camera2D

var player
var DEBUG


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func Init(owner, debug):
	player = owner
	DEBUG = debug

func SetLimits(upperLimit, lowerLimit, leftLimit, rightLimit):
	limit_bottom = lowerLimit
	limit_top = upperLimit
	limit_left = leftLimit
	limit_right = rightLimit
