extends Node2D

var player

var velocity = Vector2.ZERO
var UP = Vector2(0, -1)

#Base Values
export var BASE_ACEL = 25
export var BASE_MAX_VEL = 130
export var BASE_DECEL = 0.6


var acel 
var maxVel
var decel

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
	GetInput()
	player.MovePlayer(velocity, UP)
	
func _ready():
	ResetBaseValues()
	
############
#DIRECTIONS#
############

func GetRandomDirections():
	pass

func SetDirections(up_, down_, right_, left_):
	up = up_
	down = down_
	right = right_
	left = left_

#######
#INPUT#
#######

func GetInput():
	if Input.is_action_pressed(left):
		#Set Y Velocity To 0
		ChangeVelocityY(0,0,false, false)
		
		#Set Velocity
		SetVelocityInputX(-acel, decel, 1)
	elif Input.is_action_pressed(right):
		#Set Y Velocity To 0
		ChangeVelocityY(0,0,false, false)
		
		#Set Velocity
		SetVelocityInputX(acel, decel, -1)
	elif Input.is_action_pressed(up):
		#Set X Velocity To 0
		ChangeVelocityX(0,0,false, false)
		
		#Set Velocity
		SetVelocityInputY(-acel, decel, 1)
	elif Input.is_action_pressed(down):
		#Set X Velocity To 0
		ChangeVelocityX(0,0,false, false)
		
		#Set Velocity
		SetVelocityInputY(acel, decel, -1)
	else:
		ChangeVelocityX(decel, 0, false, true)
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

func Init(owner):
	player = owner
	
func ResetBaseValues():
	acel = BASE_ACEL
	maxVel = BASE_MAX_VEL
	decel = BASE_DECEL
	
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
