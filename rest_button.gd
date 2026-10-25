extends Button


func _on_pressed() -> void:
	$"../TextureRect2".show()
	$AudioStreamPlayer.play()
	hide()
