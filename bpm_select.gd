extends Control

var sixty_bpm_button 
var hundred_bpm_button
var one_twenty_bpm_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sixty_bpm_button = get_node("MarginContainer/BpmSelectUiContainer/BpmButtonsContainer/SixtyBpmButton")
	hundred_bpm_button = get_node("MarginContainer/BpmSelectUiContainer/BpmButtonsContainer/HundredBpmButton")
	one_twenty_bpm_button = get_node("MarginContainer/BpmSelectUiContainer/BpmButtonsContainer/OneTwentyBpmButton")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_sixty_bpm_button_pressed() -> void:
	Global.selected_bpm = 60
	get_tree().change_scene_to_file("res://game.tscn")

func _on_hundred_bpm_button_pressed() -> void:
	Global.selected_bpm = 100
	get_tree().change_scene_to_file("res://game.tscn")
	
func _on_one_twenty_bpm_button_pressed() -> void:
	Global.selected_bpm = 120
	get_tree().change_scene_to_file("res://game.tscn")
