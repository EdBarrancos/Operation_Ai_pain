extends Node2D

onready var player = $Player
onready var monster = $Monster
onready var vignette = $CanvasLayer/VignetteShader


# Called when the node enters the scene tree for the first time.
func _ready():
	vignette.SetAlpha(monster.GetPercentageHunger())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Monster_monster_is_full():
	print("Monster is Full")
	get_parent().SwitchToWinningMenu(self)


func _on_Monster_monster_is_hungry():
	print("Monster is Hungry")
	get_parent().SwitchToLosingMenu(self)


func _on_Monster_monster_got_hungrier():
	vignette.SetAlpha(monster.GetPercentageHunger())
