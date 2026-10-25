extends Button
var len = len(Global.Act1_lvl_antnum)
func _ready() -> void:
	var len = len(Global.Act1_lvl_antnum)
	if Global.map_generation[9]==0:
		Global.map_generation[9]=randi_range(0,len+1)
	if Global.map_generation[9]<len:
		$Sprite2D.show()
	if Global.map_generation[9]==len:
		$AnimatedSprite2D.show()
	if Global.map_generation[9]==len+1:
		$Sprite2D2.show()

func _process(delta: float) -> void:
	if Global.Act_progress<10:
		disabled=true
	else:
		disabled=false
	if Global.Act_progress>10:
		if Global.map_generation[9]<len:
			$Sprite2D.hide()
			$Sprite2D4.show()
		if Global.map_generation[9]==len:
			$AnimatedSprite2D.hide()
			$AnimatedSprite2D2.show()

func _on_pressed() -> void:
	Global.act+=1
	if Global.map_generation[9]<len:
		Global.Act1_level_type=Global.map_generation[9]
		get_tree().change_scene_to_file("res://Battle.tscn")
	if Global.map_generation[9]==len:
		get_tree().change_scene_to_file("res://Rest.tscn")
	if Global.map_generation[9]==len+1:
		get_tree().change_scene_to_file("res://upgrade.tscn")
