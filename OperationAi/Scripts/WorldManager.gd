extends Node2D

onready var roomScene = load("res://Scenes/Room.tscn")
onready var mainMenuScene = load("res://Scenes/Menus/MainMenu.tscn")
onready var winningMenuScene = load("res://Scenes/Menus/WinningMenu.tscn")
onready var losingMenuScene = load("res://Scenes/Menus/LosingMenu.tscn")
onready var soupCutsceneScene = load("res://Player/Scenes/SoupCutscene.tscn")
onready var introCutsceneScene = load("res://Scenes/IntroCutscene.tscn")
onready var childCutsceneScene = load("res://Scenes/ChildCutscene.tscn")

onready var musicStream = $GameMusicLoop
onready var audioServer = $AudioServer
onready var BASE_PLAYER_POSITION = Vector2(200,90)
onready var BASE_CURRENT_FOUND = 0
onready var BASE_PLAYER_CURRENT_INV = 0
onready var BASE_CURRENT_HUNGER = false
var playerPosition
var currentFound
var playerCurrentInv
var currentHunger

# Called when the node enters the scene tree for the first time.
func _ready():
	audioServer.Init(self, musicStream, 0)
	audioServer.ResetEffects()
	ResetPlayerValues()

########################
#MAIN GENERAL FUNCTIONS#
########################

func SwitchScene(currentScene, newScene):
	#Take out the currentScene
	currentScene.queue_free()
	return AddSceneInstance(newScene)
	
func AddSceneInstance(scene):
	var sceneInstance = scene.instance()
	add_child(sceneInstance)
	return sceneInstance
	
########################
#SPECIFIC SCENE CHANGES#
########################

func SwitchToSoupCutscene(currentScene, playerPos, soupImage, dialogue, playerCurrentInv_, currentHunger_):
	SwitchScene(currentScene, soupCutsceneScene).Init(soupImage, dialogue)
	playerPosition = playerPos
	currentFound += 1
	playerCurrentInv = playerCurrentInv_
	currentHunger = currentHunger_

func SwitchToRoom(currentScene, toLoad=false):
	SwitchScene(currentScene, roomScene).Init(playerPosition, toLoad, playerCurrentInv, currentHunger)
	
func SwitchToIntroCutscene(currentScene):
	SwitchScene(currentScene, introCutsceneScene)
	
func SwitchToMainMenu(currentScene):
	audioServer.ResetEffects()
	musicStream.play()
	ResetPlayerValues()
	SwitchScene(currentScene, mainMenuScene)
	
func SwitchToWinningMenu(currentScene):
	SwitchScene(currentScene, winningMenuScene)
	
func SwitchToLosingMenu(currentScene):
	SwitchScene(currentScene, losingMenuScene)

func SwitchToChildCutscene(currentScene):
	SwitchScene(currentScene, childCutsceneScene)
	
##################
#PLAYER VARIABLES#
##################

func ResetPlayerValues():
	playerPosition = BASE_PLAYER_POSITION
	currentFound = BASE_CURRENT_FOUND
	currentHunger = BASE_CURRENT_HUNGER
	playerCurrentInv = BASE_PLAYER_CURRENT_INV
