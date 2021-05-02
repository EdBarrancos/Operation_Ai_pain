extends Node2D

onready var dialogueLines = [
	"CHILD: I can't sleep now!",
	"MOTHER: It's your bedtime. No more playing",
	"CHILD: I need food!",
	"MOTHER: You already had dinner! Are you still hungry?",
	"CHILD: The monster is hungry!",
	"MOTHER: ...the monster?",
	"CHILD: He's hungry! I can't sleep if he's hungry!",
	"CHILD: He will eat me.",
	"MOTHER: Honey, there's no monster...",
	"CHILD: Yes, there IS! Under the bed!",
	"MOTHER: Monsters aren't real, honey.",
	"MOTHER: It's alright. You can go to sleep.",
	"MOTHER: I promise you're safe"
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
		get_parent().SwitchToChildCutscene(self)
	else:
		label.set_text(dialogueLines[currentLine])
		PlayChildAudio()
		currentLine += 1
		UpdateLabel()
