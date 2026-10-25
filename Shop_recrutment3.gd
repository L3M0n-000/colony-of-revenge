extends Button
var amount = round(5*(1+(Global.Act_progress/4)))
func _process(delta: float) -> void:
	$Label.text="X"+str(round(5*(1+(Global.Act_progress/4))))


func _on_pressed() -> void:
	if Global.curreny>=50:
		Global.curreny-=50
		Global.ant3_num+=amount
		Global.ant3_num_m+=amount
		$AudioStreamPlayer.play()
