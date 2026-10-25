extends Button
var len = len(Global.Act1_lvl_antnum)
func _ready() -> void:
	var len = len(Global.Act1_lvl_antnum)
	if Global.map_generation[8]==0:
		Global.map_generation[8]=randi_range(0,len+1)
	if Global.map_generation[8]<len:
		$Sprite2D.show()
	if Global.map_generation[8]==len:
		$AnimatedSprite2D.show()
	if Global.map_generation[8]==len+1:
		$Sprite2D2.show()
	if Global.map_generation[8]==len+2:
		$Sprite2D3.show()

func _process(delta: float) -> void:
	if Global.Act_progress!=9:
		disabled=true
	else:
		disabled=false
	if Global.Act_progress>9:
		if Global.map_generation[8]<len:
			$Sprite2D.hide()
			$Sprite2D4.show()
		if Global.map_generation[8]==len:
			$AnimatedSprite2D.hide()
			$AnimatedSprite2D2.show()

func _on_pressed() -> void:
	if Global.map_generation[8]<len:
		Global.Act1_level_type=Global.map_generation[8]
		get_tree().change_scene_to_file("res://Battle.tscn")
	if Global.map_generation[8]==len:
		get_tree().change_scene_to_file("res://Rest.tscn")
	if Global.map_generation[8]==len+1:
		get_tree().change_scene_to_file("res://upgrade.tscn")
	if Global.map_generation[8]==len+2:
		get_tree().change_scene_to_file("res://shop.tscn")
