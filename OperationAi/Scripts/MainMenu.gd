extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animationPlayer = $AnimationPlayer

onready var animations = ["Load", "Loop", "Back"]
onready var currentAnim = 0
onready var dir = 1
export var loopTime = 10
onready var currentLoop = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayAnimation()

func NextAnimation():
	if currentAnim + dir >= animations.size():
		currentAnim = 0
	else:
		currentAnim += dir
	print(currentAnim)
	
		
		
func PlayAnimation():
	animationPlayer.play(animations[currentAnim])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_parent().SwitchToIntroCutscene(self)
	elif Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()


func _on_AnimationPlayer_animation_finished(anim_name):
	print("Finished")
	if anim_name == "Loop":
		if currentLoop >= loopTime:
			NextAnimation()
			PlayAnimation()
			currentLoop = 0
			return
		PlayAnimation()
		currentLoop += 1
		return
	NextAnimation()
	PlayAnimation()
			
	
