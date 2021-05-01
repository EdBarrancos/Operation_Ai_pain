extends Node2D

signal monster_is_full
signal monster_is_hungry


export var maxHunger = 100
export var minHunger = 0
export var initialHunger = 0
export var baseDecreases = 10

export var waitingTime = 1

var currentHunger
var decreasesByTime

onready var timer = $DecreaseHunger

########
#EVENTS#
########

func _ready():
	ResetHunger()
	timer.set_wait_time(waitingTime)
	
func _process(_delta):
	if IsStarving():
		emit_signal("monster_is_hungry")
	if IsSatisfied():
		emit_signal("monster_is_full")
	
func _on_DecreaseHunger_timeout():
	print("Monter just Got Hungrier")
	LowerHunger(decreasesByTime)
	
###################
#HUNGER MANAGEMENT#
###################

func ResetHunger():
	currentHunger = initialHunger
	decreasesByTime = baseDecreases
	
func LowerHunger(value):
	currentHunger -= value
	
func GainHunger(value):
	currentHunger += value
	
func IsSatisfied():
	return currentHunger >= maxHunger
	
func IsStarving():
	return currentHunger <= minHunger



