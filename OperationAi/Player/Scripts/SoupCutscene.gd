extends Node2D


var dialogueLine 
var soupPath


onready var sprite = $Sprite
onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func Init(waitTime, soupPath, dialogue):
	timer.set_wait_time(waitTime)
	sprite.set_texture(load(soupPath))
	dialogueLine = dialogue


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	print(dialogueLine)
	get_parent().SwitchToRoom(self)
