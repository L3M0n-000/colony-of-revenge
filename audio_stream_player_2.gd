extends AudioStreamPlayer
func _process(delta: float) -> void:
	if Global.start==true and playing==false:
		play()
