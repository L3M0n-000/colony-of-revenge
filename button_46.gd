extends Button


func _on_pressed() -> void:
	Global.Act1_level_type=8
	get_tree().change_scene_to_file("res://Battle.tscn")
