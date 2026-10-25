extends ColorRect
func _process(delta: float) -> void:
	if Global.start==true:
		hide()
