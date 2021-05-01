extends Camera2D

export var playerPath: NodePath
var player

export var uperLimit = 300
export var lowerLimit = -300
export var rightLimit = 168
export var leftLimit = -168


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node(playerPath)


func _process(delta):
	Follow()

func Follow():
	global_position = player.global_position
