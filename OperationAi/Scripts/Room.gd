extends Node2D

onready var player = $Player
onready var monster = $Monster
onready var vignette = $CanvasLayer/VignetteShader


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Monster_monster_is_full():
	print("Monster is Full")


func _on_Monster_monster_is_hungry():
	print("Monster is Hungry")
