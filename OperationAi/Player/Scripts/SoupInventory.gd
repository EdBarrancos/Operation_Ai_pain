extends Node2D

var player
var DEBUG

onready var availableSoups = {"RED_TOMATO": 0}
export var foodValueSoups = {"RED_TOMATO": 30}
var canFeed = true

onready var currentSoup = "RED_TOMATO"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func Init(owner, debug):
	player = owner
	DEBUG = debug
	
func _process(_delta):
	if Input.is_action_just_pressed("TOMATO"):
		AddSoup()
		
	if Input.is_action_just_pressed("FEED"):
		FeedMonster()


func AddSoup(value=1, soupType="RED_TOMATO"):
	availableSoups[soupType] += value
	
#Just For abstraction
func LoseSoup(value=1, soupType="RED_TOMATO"):
	availableSoups[soupType] -= value
	
func HasCurrentSoupInInventory():
	return availableSoups[currentSoup] > 0
	
func GetCurrentSoupName():
	return currentSoup
	
func GetCurrentSoupQuantity():
	return availableSoups[currentSoup]
	
func SwitchCurrentSoup(newSoup):
	currentSoup = newSoup
	
func FeedMonster():
	if canFeed and HasCurrentSoupInInventory():
		LoseSoup()
		player.FeedMonster(foodValueSoups[currentSoup])
	
