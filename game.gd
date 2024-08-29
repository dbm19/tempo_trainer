extends Node2D

var player_hit_time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("player_hit"):
		player_hit_time = Time.get_ticks_msec()
		print("Player time: ", player_hit_time)
