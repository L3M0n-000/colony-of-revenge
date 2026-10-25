extends Button


func _on_pressed() -> void:
	if Global.act<3:
		Global.curreny+=Global.cache1
		Global.ant_num+=Global.cache2
		Global.ant_num_m+=Global.cache2
		Global.ant2_num+=Global.cache3
		Global.ant2_num_m+=Global.cache3
		Global.ant3_num+=Global.cache4
		Global.ant3_num_m+=Global.cache4
		get_tree().change_scene_to_file("res://map.tscn")
	else:
		get_tree().change_scene_to_file("res://cutscene2.tscn")
