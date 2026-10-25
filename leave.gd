extends Button


func _on_pressed() -> void:
	Global.Act_progress+=1
	if Global.taxed==true:
		Global.curreny+=Global.taxation
	get_tree().change_scene_to_file("res://map.tscn")
