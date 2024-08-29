extends AudioStreamPlayer2D

var beat_start = 0
var beat_

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_timer_timeout() -> void:
	playing = true
	beat_start = Time.get_ticks_msec()
	print(beat_start)
