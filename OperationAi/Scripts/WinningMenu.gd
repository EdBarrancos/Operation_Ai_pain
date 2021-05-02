extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var sound = 0

onready var slurp = $Slurp
onready var growl = $HappyGrowl
onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().musicStream.stop()
	PlaySlurp()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_cancel"):
		get_parent().SwitchToMainMenu(self)

func PlaySlurp():
	slurp.play()
	
func PlayGrowl():
	growl.play()
	
func StopAudios():
	slurp.stop()
	growl.stop()

func _on_Timer_timeout():
	StopAudios()
	PlayGrowl()
	timer.set_wait_time(3)
	if sound == 1:
		get_parent().SwitchToMainMenu(self)
	sound += 1
