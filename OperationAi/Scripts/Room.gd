extends Node2D

onready var player = $Player
onready var monster = $Monster
onready var vignette = $CanvasLayer/VignetteShader


func FeedMonster(value):
	monster.IncreaseHunger(value)
	vignette.SetAlpha(monster.GetPercentageHunger())


########
#EVENTS#
########


func _ready():
	vignette.SetAlpha(monster.GetPercentageHunger())


func _on_Monster_monster_is_full():
	print("Monster is Full")
	get_parent().SwitchToWinningMenu(self)


func _on_Monster_monster_is_hungry():
	print("Monster is Hungry")
	get_parent().SwitchToLosingMenu(self)


func _on_Monster_monster_got_hungrier():
	vignette.SetAlpha(monster.GetPercentageHunger())
