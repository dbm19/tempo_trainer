extends Control

var exactly_on_beat 
var ahead_of_beat
var behind_beat
var average_delta

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exactly_on_beat = get_node("VBoxContainer/ExactlyOnBeat")
	ahead_of_beat = get_node("VBoxContainer/AheadOfBeat")
	behind_beat = get_node("VBoxContainer/BehindBeat")
	average_delta = get_node("VBoxContainer/AverageDelta")
	
	exactly_on_beat.text = "Exactly on beat: " + str(Global.on_beat_total) + " times"
	ahead_of_beat.text = "Ahead of beat: " + str(Global.ahead_of_beat_total) + " times"
	behind_beat.text = "Behind the beat: " + str(Global.behind_beat_total) + " times"
	average_delta.text = "Average delta: " + str(snapped(Global.average_delta, 0.01)) + " msec"
	print(Global.average_delta)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
