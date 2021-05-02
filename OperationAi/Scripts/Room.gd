extends Node2D

onready var player = $YSort/Player
onready var monster = $Monster
onready var vignette = $CanvasLayer/VignetteShader
onready var audioServer = $AudioServer
onready var soupHandler = $YSort/SoupHandler


func FeedMonster(value):
	#Increase Hunger
	monster.IncreaseHunger(value)
	#Update Shader
	vignette.SetAlpha(monster.GetPercentageHunger())
	#Update Sounds
	audioServer.SetCurrentEffect(monster.GetQuarterHunger())
	

func FoundCan(soupImage, dialogue):
	player.playerSoupInventory.AddSoup()
	player.playerMovement.SetDirections(player.playerMovement.GetRandomDirections())
	soupHandler.save_game()
	player.playerMovement.save_game()
	get_parent().SwitchToSoupCutscene(self, player.global_position, soupImage, dialogue, player.playerSoupInventory.GetCurrentSoupQuantity(), monster.GetHunger())

func Init(playerPos, toLoad, playerCurrentInv, hunger):
	player.global_position = playerPos
	soupHandler.Init(toLoad)
	if toLoad:
		player.playerMovement.load_game()
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




func _on_Monster_monster_is_full():
	#print("Monster is Full")
	get_parent().SwitchToWinningMenu(self)


func _on_Monster_monster_is_hungry():
	#print("Monster is Hungry")
	get_parent().SwitchToLosingMenu(self)


func _on_Monster_monster_got_hungrier():
	vignette.SetAlpha(monster.GetPercentageHunger())
	audioServer.SetCurrentEffect(monster.GetQuarterHunger())


func _on_MonsterFeedingArea_body_entered(body):
	#FEED MONSTER
	if body == player:
		var feedValue = player.FeedMonster()
		FeedMonster(feedValue)
		if soupHandler.currentFound == 4:
			#He collected all in the end
			_on_Monster_monster_is_full()
