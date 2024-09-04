extends Control

var new_game_button
var tutorial_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game_button = get_node("MainMenuUiContainer/NewGameButton")
	tutorial_button = get_node("MainMenuUiContainer/TutorialButton")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_new_game_button_pressed() -> void:
	Global.menu_sound.playing = true
	get_tree().change_scene_to_file("res://bpm_select.tscn")
	
func _on_new_game_button_mouse_entered() -> void:
	new_game_button.icon = load("res://art_assets/new_game_button_hovered.png")
	
func _on_new_game_button_mouse_exited() -> void:
	new_game_button.icon = load("res://art_assets/new_game_button.png")

func _on_new_game_button_button_down() -> void:
	new_game_button.icon = load("res://art_assets/new_game_button_pressed.png")

func _on_tutorial_button_pressed() -> void:
	Global.menu_sound.playing = true
	get_tree().change_scene_to_file("res://tutorial.tscn")

func _on_tutorial_button_mouse_entered() -> void:
	tutorial_button.icon = load("res://art_assets/tutorial_button_hovered.png")

func _on_tutorial_button_mouse_exited() -> void:
	tutorial_button.icon = load("res://art_assets/tutorial_button.png")

func _on_tutorial_button_button_down() -> void:
	tutorial_button.icon = load("res://art_assets/tutorial_button_pressed.png")
