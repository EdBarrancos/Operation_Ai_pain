extends Camera2D

export var playerPath: NodePath
var player

export var upperLimit = 300
export var lowerLimit = -300
export var rightLimit = 168
export var leftLimit = -168


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node(playerPath)
	limit_bottom = lowerLimit
	limit_top = upperLimit
	limit_left = leftLimit
	limit_right = rightLimit


func _process(delta):
	Follow()

func Follow():
	global_position = player.global_position
	
func UpdateX(value):
	global_position.x = value
	
func UpdateY(value):
	global_position.y = value
