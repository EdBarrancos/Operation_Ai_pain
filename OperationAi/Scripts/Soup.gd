extends Area2D


export var newSpriteTexture: Texture
onready var sprite = $Sprite


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.set_texture(newSpriteTexture)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
