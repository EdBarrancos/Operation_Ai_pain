extends Node2D

var player

var velocity = Vector2.ZERO
var UP = Vector2(0, -1)

#Base Variables
export var BASE_ACEL = 25
export var BASE_MAX_VEL = 130
export var BASE_DECEL = 0.6


var acel 
var maxVel
var decel


func _ready():
	ResetBaseValues()


func Init(owner):
	player = owner
	
	
func ResetBaseValues():
	acel = BASE_ACEL
	maxVel = BASE_MAX_VEL
	decel = BASE_DECEL


func GetInput():
	if Input.is_action_pressed("LEFT"):
		#Turn Sprite
		#player.playerSprite.TurnLeft()
		
		#Set Y Velocity To 0
		ChangeVelocityY(0,0,false, false)
		
		#Set Velocity
		if velocity.x > 0: ChangeVelocityX(decel, -acel, false, true)
		else: ChangeVelocityX(-acel, maxVel, true)
	elif Input.is_action_pressed("RIGHT"):
		#Turn Sprite
		#player.playerSprite.TurnRight()
		
		#Set Y Velocity To 0
		ChangeVelocityY(0,0,false, false)
		
		#Set Velocity
		if -velocity.x > 0: ChangeVelocityX(decel, acel, false, true)
		else: ChangeVelocityX(acel, maxVel, true)
	else:
		ChangeVelocityX(decel, 0, false, true)


func _physics_process(_delta):
	GetInput()
	player.move_player(velocity, UP)


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
