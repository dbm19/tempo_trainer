extends Node2D

var previous_player_hit_time= 0
var player_hit_time_delta = 0
var current_player_hit_time = 0
var bass_drum
var bass_drum_timer
var bass_drum_timer_goal
var countdown
var eight_count
var number_of_beats
var game_start
var score_set = []
var beat_sprite_scene
var beat_sprite
var sprite_positions = [0, 1, 2, 3, 4, 5]
var rng
var current_sprite_position
var previous_sprite_position

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bass_drum = get_node("BassDrum")
	bass_drum_timer = get_node("BassDrum/BassDrumTimer")
	countdown = get_node("Countdown")
	eight_count = 8
	number_of_beats = Global.selected_length
	game_start = false
	beat_sprite_scene = preload("res://beat_sprite.tscn")
	sprite_positions[0] = get_node("SpritePositionOne")
	sprite_positions[1] = get_node("SpritePositionTwo")
	sprite_positions[2] = get_node("SpritePositionThree")
	sprite_positions[3] = get_node("SpritePositionFour")
	sprite_positions[4] = get_node("SpritePositionFive")
	sprite_positions[5] = get_node("SpritePositionSix")

	bass_drum_timer.wait_time = snapped(float(60.0 / Global.selected_bpm), 0.01)
	
	bass_drum_timer_goal = bass_drum_timer.wait_time * 1000
	bass_drum.playing = true
	bass_drum_timer.start()
	countdown.text = str(eight_count)
	
	print("Goal: ", bass_drum_timer_goal)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_start == true:
		if Input.is_action_just_pressed("player_hit"):
			current_player_hit_time = Time.get_ticks_msec()
			player_hit_time_delta = current_player_hit_time - previous_player_hit_time
			previous_player_hit_time = current_player_hit_time
			score_set.append((player_hit_time_delta * 100.0) / bass_drum_timer_goal )
			
			beat_sprite = beat_sprite_scene.instantiate()
			rng = RandomNumberGenerator.new()
			var sprite_positions_index = rng.randi_range(0, 5)
			current_sprite_position = sprite_positions[sprite_positions_index]
			if current_sprite_position != previous_sprite_position:
				current_sprite_position.add_child(beat_sprite)
			else:
				if sprite_positions_index != 5:
					current_sprite_position = sprite_positions[sprite_positions_index + 1]
				else:
					current_sprite_position = sprite_positions[0]
				current_sprite_position.add_child(beat_sprite)
			previous_sprite_position = current_sprite_position
			
			print("Your score: ", player_hit_time_delta)

func _on_bass_drum_timer_timeout() -> void:
	bass_drum.playing = true

	if eight_count > 1:
		eight_count -= 1
		countdown.text = str(eight_count)
		if eight_count == 1:
			previous_player_hit_time = Time.get_ticks_msec()
			print(previous_player_hit_time)
	else:
		game_start = true
		number_of_beats -= 1
		countdown.text = ""
		bass_drum.volume_db = -100
		if number_of_beats == -1:
			print(score_set)
			get_tree().change_scene_to_file("res://score_screen.tscn")
