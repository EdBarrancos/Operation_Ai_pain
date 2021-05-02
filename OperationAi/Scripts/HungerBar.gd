extends HBoxContainer

onready var bar=$Bar
var hungerPercentage


func _process(_delta):
	hungerPercentage = get_parent().get_parent().monster.GetPercentageHunger()
	get_node("Bar").value = hungerPercentage
