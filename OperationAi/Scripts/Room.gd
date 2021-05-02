extends Node2D

onready var player = $YSort/Player
onready var monster = $Monster
onready var vignette = $CanvasLayer/VignetteShader
onready var audioServer = $AudioServer
onready var soupHandler = $YSort/SoupHandler


func FeedMonster(value):
	monster.IncreaseHunger(value)
	vignette.SetAlpha(monster.GetPercentageHunger())
	audioServer.SetCurrentEffect(monster.GetQuarterHunger())


func Init(playerPos, toLoad, playerCurrentInv, hunger):
	player.global_position = playerPos
	soupHandler.Init(toLoad)
	player.playerSoupInventory.SetCurrentSoupQuantity(playerCurrentInv)
	if hunger:
		monster.SetHunger(hunger)
		vignette.SetAlpha(monster.GetPercentageHunger())
	

########
#EVENTS#
########


func _ready():
	vignette.SetAlpha(monster.GetPercentageHunger())
	audioServer.Init(self, get_parent().musicStream, monster.GetQuarterHunger())

func FoundCan(soupImage, dialogue):
	player.playerSoupInventory.AddSoup()
	soupHandler.save_game()
	get_parent().SwitchToSoupCutscene(self, player.global_position, soupImage, dialogue, player.playerSoupInventory.GetCurrentSoupQuantity(), monster.GetHunger())


func _on_Monster_monster_is_full():
	#print("Monster is Full")
	get_parent().SwitchToWinningMenu(self)


func _on_Monster_monster_is_hungry():
	#print("Monster is Hungry")
	get_parent().SwitchToLosingMenu(self)


func _on_Monster_monster_got_hungrier():
	vignette.SetAlpha(monster.GetPercentageHunger())
	audioServer.SetCurrentEffect(monster.GetQuarterHunger())
