extends Button
var count=0

func _on_pressed() -> void:
	count+=1

func _process(delta: float) -> void:
	if count==1:
		$"../Label".show()
	if count==2:
		get_tree().change_scene_to_file("res://Main_menu.tscn")
