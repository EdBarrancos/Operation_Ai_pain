extends Node2D

onready var roomScene = load("res://Scenes/Room.tscn")
onready var mainMenuScene = load("res://Scenes/Menus/MainMenu.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

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
	SwitchScene(currentScene, mainMenuScene)
