extends Sprite


export var initialAlpha = 0
export var finalAlpha = 1.0


# Called when the node enters the scene tree for the first time.
func _ready():
	ResetAlpha()
	

func ResetAlpha():
	modulate.a = initialAlpha
	
func SetAlpha(percentage):
	modulate.a = (finalAlpha*percentage)/100
