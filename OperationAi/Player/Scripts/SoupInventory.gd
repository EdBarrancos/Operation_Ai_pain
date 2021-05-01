extends Node2D

var player
var DEBUG


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func Init(owner, debug):
	player = owner
	DEBUG = debug


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
