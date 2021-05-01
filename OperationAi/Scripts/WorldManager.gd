extends Node2D

onready var roomScene = load("res://Scenes/Room.tscn")
onready var mainMenuScene = load("res://Scenes/Menus/MainMenu.tscn")
onready var winningMenuScene = load("res://Scenes/Menus/WinningMenu.tscn")
onready var losingMenuScene = load("res://Scenes/Menus/LosingMenu.tscn")

onready var musicStream = $GameMusicLoop
onready var audioServer = $AudioServer

# Called when the node enters the scene tree for the first time.
func _ready():
	audioServer.Init(self, musicStream, 0)
	audioServer.ResetEffects()

########################
#MAIN GENERAL FUNCTIONS#
########################

func SwitchScene(currentScene, newScene):
	#Take out the currentScene
	currentScene.queue_free()
	AddSceneInstance(newScene)
	
func AddSceneInstance(scene):
	var sceneInstance = scene.instance()
	add_child(sceneInstance)
	
########################
#SPECIFIC SCENE CHANGES#
########################

func SwitchToRoom(currentScene):
	SwitchScene(currentScene, roomScene)
	
func SwitchToMainMenu(currentScene):
	audioServer.ResetEffects()
	SwitchScene(currentScene, mainMenuScene)
	
func SwitchToWinningMenu(currentScene):
	SwitchScene(currentScene, winningMenuScene)
	
func SwitchToLosingMenu(currentScene):
	SwitchScene(currentScene, losingMenuScene)
