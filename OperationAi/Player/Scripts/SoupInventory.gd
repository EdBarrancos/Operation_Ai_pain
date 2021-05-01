extends Node2D

var player
var DEBUG

onready var availableSoups = {"RED_TOMATO": 0}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func Init(owner, debug):
	player = owner
	DEBUG = debug


func AddSoup(value=1, soupType="RED_TOMATO"):
	availableSoups[soupType] += value
	
#Just For abstraction
func LoseSoup(value=1, soupType="RED_TOMATO"):
	availableSoups[soupType] -= value
	
