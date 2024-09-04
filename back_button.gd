extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if self.name == "BackButtonTwo":
		get_tree().change_scene_to_file("res://bpm_select.tscn")
	else:
		get_tree().change_scene_to_file("res://main_menu.tscn")
	Global.menu_sound.playing = true


func _on_mouse_entered() -> void:
	icon = load("res://art_assets/back_button_hovered.png")

func _on_mouse_exited() -> void:
	icon = load("res://art_assets/back_button.png")

func _on_button_down() -> void:
	icon = load("res://art_assets/back_button_pressed.png")
