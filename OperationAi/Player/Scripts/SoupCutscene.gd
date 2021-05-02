extends Node2D


var dialogueLine 
var soupPath


onready var sprite = $Sprite
onready var timer = $Timer
onready var label = $RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func Init(soupImage, dialogue):
	sprite.set_texture(soupImage)
	dialogueLine = dialogue
	label.set_text(dialogueLine)
	label.get_font("normal_font").font_data.antialiased = false
	label.get_font("normal_font").use_filter = true
	label.get_font("normal_font").use_filter = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_parent().SwitchToRoom(self, true)


func _on_Timer_timeout():
	print(dialogueLine)
	get_parent().SwitchToRoom(self, true)
