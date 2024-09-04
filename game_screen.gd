extends Control

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
var drum_hit
var drum_hit_array = []
var drum_hit_array_index = 0

func _ready() -> void:
	bass_drum = get_node("BassDrum")
	bass_drum_timer = get_node("BassDrum/BassDrumTimer")
	countdown = get_node("Countdown")
	eight_count = 8
	number_of_beats = Global.selected_length
	game_start = false
	beat_sprite_scene = preload("res://beat_sprite.tscn")
	sprite_positions[0] = get_node("Control/SpritePositionOne")
	sprite_positions[1] = get_node("Control/SpritePositionTwo")
	sprite_positions[2] = get_node("Control/SpritePositionThree")
	sprite_positions[3] = get_node("Control/SpritePositionFour")
	sprite_positions[4] = get_node("Control/SpritePositionFive")
	sprite_positions[5] = get_node("Control/SpritePositionSix")

	bass_drum_timer.wait_time = snapped(float(60.0 / Global.selected_bpm), 0.01)
	
	bass_drum_timer_goal = bass_drum_timer.wait_time * 1000
	bass_drum.playing = true
	bass_drum_timer.start()
	countdown.text = str(eight_count)

func _process(delta: float) -> void:
	if game_start == true:
		if Input.is_action_just_pressed("player_hit"):
			current_player_hit_time = Time.get_ticks_msec()
			player_hit_time_delta = current_player_hit_time - drum_hit_array[drum_hit_array_index]
			print(drum_hit_array[drum_hit_array_index], " ", current_player_hit_time)
			score_set.append(abs(player_hit_time_delta))
			
			if player_hit_time_delta < 0:
				Global.ahead_of_beat_total += 1
			elif player_hit_time_delta > 0:
				Global.behind_beat_total += 1
			else:
				Global.on_beat_total += 1
			
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
			
			drum_hit_array_index += 1
			Global.average_delta += abs(player_hit_time_delta)
			print(Global.average_delta)
			print("Your score: ", player_hit_time_delta)
			
		if drum_hit_array_index == drum_hit_array.size():
				print(score_set)
				get_tree().change_scene_to_file("res://score_screen.tscn")

func _on_bass_drum_timer_timeout() -> void:
	bass_drum.playing = true

	if eight_count > 1:
		eight_count -= 1
		countdown.text = str(eight_count)
	else:
		game_start = true
		number_of_beats -= 1
		countdown.text = ""
		bass_drum.volume_db = -100
		drum_hit = Time.get_ticks_msec()
		if eight_count == 1:
			drum_hit_array.append(drum_hit)
			for n in range(1, Global.selected_length + 1):
				drum_hit_array.append(drum_hit + (n * bass_drum_timer_goal))
			eight_count -= 1
		if number_of_beats == -1:
			print(score_set)
			print(Global.selected_length)
			Global.average_delta = Global.average_delta / Global.selected_length
			get_tree().change_scene_to_file("res://score_screen.tscn")
