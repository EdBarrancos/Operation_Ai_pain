extends Node2D

onready var roomScene = load("res://Scenes/Room.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func SwitchScene(currentScene, newScene):
	#Take out the currentScene
	currentScene.queue_free()
	AddSceneInstance(newScene)
	
func AddSceneInstance(scene):
	var sceneInstance = scene.instance()
	add_child(sceneInstance)
