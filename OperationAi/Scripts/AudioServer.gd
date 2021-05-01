extends Node2D

var musicStreamBusIndex
var parent

var noEffect = funcref(self, "SetNoEffect")
var distortion = funcref(self, "SetDistortion")
var phaser = funcref(self, "SetPhaser")
var delay = funcref(self, "SetDelay")
var reverb = funcref(self, "SetReverb")

onready var effects = [noEffect, distortion, phaser, delay, reverb]
var currentEffect = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func Init(owner_, musicStream_, starterEffect):
	parent = owner_
	musicStreamBusIndex = AudioServer.get_bus_index(musicStream_.get_bus())
	SetStarterEffect(starterEffect)
	
func SetStarterEffect(starterEffect):
	for i in range(starterEffect):
		effects[i].call_func()
	currentEffect = starterEffect
	
func SetCurrentEffect(nm):
	if nm != null:
		if nm > currentEffect:
			#increaseEffect
			currentEffect = nm
			effects[currentEffect].call_func()
			#print("New Effect")
		elif currentEffect > nm:
			#decreaseEffect
			effects[currentEffect].call_func(false)
			currentEffect = nm
			#print("Remove Effect")
	


###########
#Low Level#
###########

func SetNoEffect(value=true):
	pass

func SetDistortion(value=true):
	AudioServer.set_bus_effect_enabled(musicStreamBusIndex, 1, value)
	
func SetPhaser(value=true):
	AudioServer.set_bus_effect_enabled(musicStreamBusIndex, 2, value)
	
func SetDelay(value=true):
	AudioServer.set_bus_effect_enabled(musicStreamBusIndex, 3, value)
	
func SetReverb(value=true):
	AudioServer.set_bus_effect_enabled(musicStreamBusIndex, 4, value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
