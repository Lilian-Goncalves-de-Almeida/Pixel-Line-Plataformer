extends Control

onready var label = get_node("Text")

func _ready():
	label.text = "Game Over\nPontuação\n" + str(Globals.enemies_count)
	Globals.enemies_count = 0

func on_button_pressed():
	var _reload = get_tree().change_scene("res://scenes/management/level.tscn")


func on_back_to_menu_pressed():
	var _reload = get_tree().change_scene("res://scenes/management/menu.tscn")
