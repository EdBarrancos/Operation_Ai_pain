extends Node2D


onready var dialogueLines = [
	"CHILD: The monster is real! I know it!",
	"CHILD: I need to give him something to eat.",
	"CHILD: ...Maybe the cans I got from Mommy’s bag today are food!",
	"CHILD: Maybe I can give them to the monster!",
	"CHILD: I was playing with them earlier.",
	"CHILD: Where are they now?",
	"CHILD: I need to get up and get them before the monster comes out!",

]

onready var label = $label
onready var childAudio = $Child

onready var currentLine = 0


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") or Input.is_action_just_pressed("ui_accept"):
		get_parent().SwitchToRoom(self)
	
func PlayChildAudio():
	childAudio.play()
	
func StopAudios():
	childAudio.stop()
	
func _ready():
	StopAudios()
	label.set_text(dialogueLines[currentLine])
	PlayChildAudio()
	currentLine += 1
	UpdateLabel()
	
func UpdateLabel():
	label.get_font("normal_font").font_data.antialiased = false
	label.get_font("normal_font").use_filter = true
	label.get_font("normal_font").use_filter = false

func _on_Timer_timeout():
	StopAudios()
	if currentLine + 1 > dialogueLines.size():
		get_parent().SwitchToRoom(self)
	else:
		label.set_text(dialogueLines[currentLine])
		PlayChildAudio()
		currentLine += 1
		UpdateLabel()
