extends Button
var count = 0
func _process(delta: float) -> void:
	if count==1:
		$"../Sprite2D".show()
	if count==2:
		$"../Sprite2D2".show()
	if count==3:
		$"../Sprite2D3".show()
	if count==4:
		$"../Sprite2D4".show()
	if count==5:
		$"../Sprite2D".hide()
		$"../Sprite2D2".hide()
		$"../Sprite2D3".hide()
		$"../Sprite2D4".hide()
		$"../TextureRect".hide()
	if count==6:
		$"../TextureRect2".hide()
	if count==7:
		$"../ColorRect4".hide()
	if count==8:
		$"../TextureRect3".hide()
	if count==9:
		$"../TextureRect4".hide()
	if count==10:
		$"../TextureRect5".hide()
	if count==11:
		$"../ColorRect2".hide()
	if count==12:
		$"../ColorRect".hide()
	if count==13:
		get_tree().change_scene_to_file("res://map.tscn")

func _on_pressed() -> void:
	count+=1
