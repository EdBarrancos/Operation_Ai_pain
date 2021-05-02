extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_font("font").font_data.antialiased = false
	get_font("font").use_filter = true
	get_font("font").use_filter = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
