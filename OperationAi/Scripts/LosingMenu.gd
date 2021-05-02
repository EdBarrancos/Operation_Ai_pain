extends Node2D

onready var cutsceneImages = [preload("res://Scenes/Menus/Cutscene/monster_hungry1.png"),
preload("res://Scenes/Menus/Cutscene/monster_hungry2.png"),
preload("res://Scenes/Menus/Cutscene/monster_hungry3.png"),
preload("res://Scenes/Menus/Cutscene/monster_hungry4.png"),
preload("res://Scenes/Menus/Cutscene/monster_hungry5.png")]

onready var sprite = $Sprite
onready var cutsceneTimer = $CutsceneTimer
onready var growl = $Growl
onready var currentImage = 0

export var cutsceneWaitingTime = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	cutsceneTimer.set_wait_time(cutsceneWaitingTime)
	sprite.set_texture(cutsceneImages[currentImage])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_parent().SwitchToRoom(self)


func _on_CutsceneTimer_timeout():
	if currentImage + 1 >= cutsceneImages.size():
		get_parent().SwitchToMainMenu(self)
	else:
		currentImage+=1
		if currentImage + 1 >= cutsceneImages.size():
			growl.play()
		sprite.texture = cutsceneImages[currentImage]
