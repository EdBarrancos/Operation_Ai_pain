extends Node2D

onready var cutsceneImages = [preload("res://Scenes/Cutscene/soup1.png"),
preload("res://Scenes/Cutscene/soup2.png"),
preload("res://Scenes/Cutscene/soup3.png"),
preload("res://Scenes/Cutscene/soup4.png")]

onready var dialogueLines = ["I found one! I don't know if it tastes, but I hope he likes it",
"Another one! Is it the same as the other? That's weird.",
"One more! I hope he doesn't mind eating a lot of the same thing...",
"The last one! I'll take these to him under the bed..."]

onready var soups = [$Soup, $Soup2, $Soup3, $Soup4]
onready var lock = true
onready var currentFound = 0
onready var availableSoups = [true, true, true, true]


# Called when the node enters the scene tree for the first time.
func _ready():
	lock = true

func Init(toLoad):
	if toLoad:
		load_game()
	lock = false
	
func UpdateSoups():
	print("UPDATING")
	var j = 0
	for i in range(availableSoups.size()):
		if not availableSoups[i]:
			remove_child(get_children()[j])
			soups[i].queue_free()
			j -= 1
		j += 1
	lock = false

func _on_Soup2_body_entered(body):
	if not lock:
		if availableSoups[1]:
			availableSoups[1] = false
			currentFound += 1
			get_parent().get_parent().FoundCan(cutsceneImages[currentFound-1], dialogueLines[currentFound-1])

func _on_Soup_body_entered(body):
	if not lock:
		if availableSoups[0]:
			print(lock)
			print(availableSoups[0])
			availableSoups[0] = false
			currentFound += 1
			get_parent().get_parent().FoundCan(cutsceneImages[currentFound-1], dialogueLines[currentFound-1])


func _on_Soup3_body_entered(body):
	if not lock:
		if availableSoups[2]:
			availableSoups[2] = false
			currentFound += 1
			get_parent().get_parent().FoundCan(cutsceneImages[currentFound-1], dialogueLines[currentFound-1])


func _on_Soup4_body_entered(body):
	if not lock:
		if availableSoups[3]:
			availableSoups[3] = false
			currentFound += 1
			get_parent().get_parent().FoundCan(cutsceneImages[currentFound-1], dialogueLines[currentFound-1])	

func save_dict():
	var save_dict = {
		"currentFound": currentFound,
		"availableSoups": availableSoups
	}
	return save_dict
	
func save_game():
	print("SAVING")
	var save_game = File.new()
	save_game.open("user://soupHandler.save", File.WRITE)
	save_game.store_line(to_json(save_dict()))
	save_game.close()
	
func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://soupHandler.save"): return
	save_game.open("user://soupHandler.save", File.READ)
	
	var variable_data = parse_json(save_game.get_line())
	
	for i in variable_data.keys():
		print(variable_data[i])
		self.set(i, variable_data[i])
		
	print(availableSoups)
	
	save_game.close()
	UpdateSoups()
	

