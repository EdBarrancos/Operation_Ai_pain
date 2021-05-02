extends Node2D

onready var player = $Player
onready var monster = $Monster
onready var vignette = $CanvasLayer/VignetteShader
onready var audioServer = $AudioServer


func FeedMonster(value):
	monster.IncreaseHunger(value)
	vignette.SetAlpha(monster.GetPercentageHunger())
	audioServer.SetCurrentEffect(monster.GetQuarterHunger())


func Init(playerPos):
	player.global_position = playerPos

########
#EVENTS#
########


func _ready():
	vignette.SetAlpha(monster.GetPercentageHunger())
	audioServer.Init(self, get_parent().musicStream, monster.GetQuarterHunger())


func _on_Monster_monster_is_full():
	#print("Monster is Full")
	get_parent().SwitchToWinningMenu(self)


func _on_Monster_monster_is_hungry():
	#print("Monster is Hungry")
	get_parent().SwitchToLosingMenu(self)


func _on_Monster_monster_got_hungrier():
	vignette.SetAlpha(monster.GetPercentageHunger())
	audioServer.SetCurrentEffect(monster.GetQuarterHunger())
