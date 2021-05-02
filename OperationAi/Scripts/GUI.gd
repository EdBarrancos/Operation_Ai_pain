extends MarginContainer

onready var label=$Counter/Label
var soups

func _process(_delta):
	soups = get_parent().get_parent().player.playerSoupInventory.GetCurrentSoupQuantity()
	label.set_text(str(soups))
