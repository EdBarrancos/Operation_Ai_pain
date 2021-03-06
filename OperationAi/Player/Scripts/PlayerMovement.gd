extends Node2D

var player

var velocity = Vector2.ZERO
var UP = Vector2(0, -1)

#Base Values
export var BASE_ACEL = 25
export var BASE_MAX_VEL = 130
export var BASE_DECEL = 0.6

var DEBUG
var acel 
var maxVel
var decel

var movementLock = false

#Directions
onready var availableDirections = ["UP", "DOWN", "RIGHT", "LEFT"]
onready var up = "UP"
onready var down = "DOWN"
onready var right = "RIGHT"
onready var left = "LEFT"

##############
#GODOT EVENTS#
##############

func _physics_process(_delta):
	if not movementLock: 
		GetInput()
		NormalizeVelocity()
	else:
		ChangeVelocityX(decel, 0, false, true)
		ChangeVelocityY(decel, 0, false, true)
	player.MovePlayer(velocity, UP)
	
func _ready():
	ResetBaseValues()
	
############
#DIRECTIONS#
############

func GetRandomDirections():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var randomDirections = []
	
	while randomDirections.size() != availableDirections.size():
		#Get Random Number
		var rNumber = rng.randi_range(0, availableDirections.size() - 1)
		
		#Check Availability
		if randomDirections.has(availableDirections[rNumber]): continue
		
		#Add
		randomDirections.append(availableDirections[rNumber])
	
	if DEBUG: print(randomDirections)
	return randomDirections

func SetDirections(newDirVec):
	#up, down, right, left
	up = newDirVec[0]
	down = newDirVec[1]
	right = newDirVec[2]
	left = newDirVec[3]

#######
#INPUT#
#######

func GetInput():
	if Input.is_action_pressed(left):
		#Set Y Velocity To 0
		#ChangeVelocityY(0,0,false, false)
		
		#Set Velocity
		SetVelocityInputX(-acel, decel, 1)
	elif Input.is_action_pressed(right):
		#Set Y Velocity To 0
		#ChangeVelocityY(0,0,false, false)
		
		#Set Velocity
		SetVelocityInputX(acel, decel, -1)
	else:
		ChangeVelocityX(decel, 0, false, true)
	if Input.is_action_pressed(up):
		#Set X Velocity To 0
		#ChangeVelocityX(0,0,false, false)
		
		#Set Velocity
		SetVelocityInputY(-acel, decel, 1)
	elif Input.is_action_pressed(down):
		#Set X Velocity To 0
		#ChangeVelocityX(0,0,false, false)
		
		#Set Velocity
		SetVelocityInputY(acel, decel, -1)
	else:
		ChangeVelocityY(decel, 0, false, true)


func SetVelocityInputY(acel_, decel_, dir):
	if dir * velocity.y > 0: ChangeVelocityY(decel_, acel_, false, true)
	else: ChangeVelocityY(acel_, maxVel, true)
	
func SetVelocityInputX(acel_, decel_, dir):
	if dir * velocity.x > 0: ChangeVelocityX(decel_, acel_, false, true)
	else: ChangeVelocityX(acel_, maxVel, true)


#######################
#"SETTERS AND GETTERS"#
#######################

func Init(owner, debug):
	player = owner
	DEBUG = debug
	
func ResetBaseValues():
	acel = BASE_ACEL
	maxVel = BASE_MAX_VEL
	decel = BASE_DECEL
	
func GetVelocityLength():
	return velocity.length()
	
func ChangeVelocityX(value, maxVelocity=0, adding=true, gradual=false):
	""" adding -> if you want to just set value or add it to current velocity
		gradual -> will lerp the velocity to maxVelocity with weight value"""
	if!gradual:
		if adding: 
			velocity.x += value
		else: velocity.x = value
		
		if maxVelocity: velocity.x = clamp(velocity.x, -maxVelocity, maxVelocity)
	else: velocity.x = lerp(velocity.x, maxVelocity, value)
	return velocity


func ChangeVelocityY(value, maxVelocity=0, adding=true, gradual=false):
	""" adding -> if you want to just set value or add it to current velocity
		gradual -> will lerp the velocity to maxVelocity with weight value"""
	if !gradual:
		if adding: 
			velocity.y += value
		else: velocity.y = value
		
		if maxVelocity: velocity.y = clamp(velocity.y, -maxVelocity, maxVelocity)
	else: velocity.y = lerp(velocity.y, maxVelocity, value)
	return velocity
	

func NormalizeVelocity():
	if velocity.length() > maxVel:
		velocity = velocity.normalized()*maxVel
		
#################
#SAVE GAME STUFF#
#################

func save_dict():
	var save_dict = {
		"up": up,
		"down": down,
		"left": left,
		"right": right
	}
	return save_dict
	
func save_game():
	var save_game  = File.new()
	save_game.open("user://playerKeys.save", File.WRITE)
	save_game.store_line(to_json(save_dict()))
	save_game.close()
	
func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://playerKeys.save"):
		return
	save_game.open("user://playerKeys.save", File.READ)
	
	var variable_data = parse_json(save_game.get_line())
	
	for i in variable_data:
		set(i, variable_data[i])
		
	save_game.close()
		
