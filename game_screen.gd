extends Node2D

var player_hit_time = 0
var player_hit_time_delta = 0
var current_time_in_msec = 0
var bass_drum
var bass_drum_timer
var bass_drum_timer_goal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bass_drum = get_node("BassDrum")
	bass_drum_timer = get_node("BassDrum/BassDrumTimer")

	bass_drum_timer.wait_time = snapped(float(60.0 / Global.selected_bpm), 0.01)
	
	print(bass_drum_timer.wait_time, " ", float(60.0/Global.selected_bpm))
	bass_drum_timer_goal = bass_drum_timer.wait_time * 1000
	bass_drum.playing = true
	bass_drum_timer.start()
	print("Goal: ", bass_drum_timer_goal)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("player_hit"):
		current_time_in_msec = Time.get_ticks_msec()
		player_hit_time_delta = current_time_in_msec - player_hit_time
		player_hit_time = current_time_in_msec
		print("Your score: ", player_hit_time_delta)

func _on_bass_drum_timer_timeout() -> void:
	bass_drum.playing = true
	
